//
//  AuthViewModel.swift
//  SafeSpace
//
//  Created by Aman Narmah on 27/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

//publishes UI changes to main thread
@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        //check and see if there is a current user, stay logged in 
        self.userSession = Auth.auth().currentUser
        //fetches user data
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign in...")
    }
    
    
    //asyncronus function
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
    
    func signOut (){
        
    }
    
    func deleteAccount () {
        
    }
    
    func fetchUser () async {
        //if there is no current user will not fetch
        guard let uid = Auth.auth().currentUser?.uid else {return}
        //if there is a current user fetch
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
}
