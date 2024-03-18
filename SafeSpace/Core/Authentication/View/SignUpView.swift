//
//  SignUpView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 15/01/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack{
            Image("ssLogo")
                .resizable()
                .scaledToFill()
                .frame(width:100, height:100)
                .padding(.vertical, 32)

            VStack(spacing:24){
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "....@..")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter Name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter Password..",
                          isSecureField: true)
                
                ZStack(alignment: .trailing ) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your Password..",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            //sign up button
            
            Button{
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password:password,
                                                   fullname:fullname)
                }
            } label: {
                HStack {
                    Text("Create account")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width:UIScreen.main.bounds.width - 32, height :48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top,24)
            //form valid sign in button
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            
            Spacer()
            
            VStack (spacing: 12){
                
                NavigationLink{
                    TherapistSignUp()
                        .navigationBarBackButtonHidden()
                }label: {
                    HStack (spacing:3){
                    Text("Licensed Doctor?")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Text("Create account")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size:14))
                }

                
                Button{
                    dismiss()
                } label: {
                    HStack (spacing:3){
                    Text("Have an account?")
                        Text("Sign in")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size:14))
                }
            }
            
           
        }
    }
}

//form authentication

extension SignUpView: AuthenticationFormProtcol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 7
        && !fullname.isEmpty
        && confirmPassword == password
    }
    
    
}

#Preview {
    SignUpView()
}
