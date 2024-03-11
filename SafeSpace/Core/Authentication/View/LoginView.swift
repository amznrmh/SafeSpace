//
//  LoginView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 15/01/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image("ssLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height:100)
                    .padding(.vertical, 32)
                
                // form fields
                VStack(spacing:24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "....@..")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter Password..",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                Button{
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                //form valid sign in button 
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                
                Spacer()
                
                // sign up button
                
                NavigationLink{
                    SignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack (spacing:4){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size:14))
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtcol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 7
    }
    
    
}

#Preview {
    LoginView()
}
