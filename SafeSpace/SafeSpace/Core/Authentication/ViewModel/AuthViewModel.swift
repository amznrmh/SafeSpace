//
//  AuthViewModel.swift
//  SafeSpace
//
//  Created by Aman Narmah on 27/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtcol {
    var formIsValid: Bool {get}
}

//publishes UI changes to main thread
@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    //therapists
//    @Published var therapistsSession: FirebaseAuth.Therapists?
//    @Published var currentTherapists: Therapists?
    
    init() {
        //check and see if there is a current user, stay logged in 
        self.userSession = Auth.auth().currentUser
        //fetches user data
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            //fetches user data
            await fetchUser()
        } catch {
            print ("DEBUG: Failed to log in user with error \(error.localizedDescription)")
        }
    }
    
    
    //asyncronus function creates user account
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do{
    //create user using firebase code, await and store in result
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
    //successful result = userSession
            self.userSession = result.user
            let user = User (id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
    //upload data to firestore
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            //fetch data to be displayed when account created
            await fetchUser()
        } catch {
    //error handling
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
   // create account for professional therapists
//    func createProfessionalAcc (withEmail email : String, password: String, fullname: String, qualifications: String, field: String) async throws {
//        do{
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            self.therapistsSession = result.therapists
//            let therapists = Therapists (id: result.therapists.uid)
//        }
//    }
    
    func signOut (){
        do {
            try Auth.auth().signOut() //sign user out from backend
            self.userSession = nil //ends userSession 
            self.currentUser = nil //ends currentUser data 
        } catch {
            print("DEBUG: failed to sign out\(error.localizedDescription)")
        }
    }
    
    func deleteAccount () {
        
    }
    
    func fetchUser () async {
        //if there is no current user will not fetch
        guard let uid = Auth.auth().currentUser?.uid else {return}
        //if there is a current user fetch
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        
        
    }
}
