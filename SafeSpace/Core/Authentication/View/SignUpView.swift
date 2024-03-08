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
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your Password..",
                          isSecureField: true)
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
            
            Spacer()
            
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

#Preview {
    SignUpView()
}
