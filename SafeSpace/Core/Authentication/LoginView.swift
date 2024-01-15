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
                    print("Log user in...")
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
                
                Spacer()
                
                // sign up button
                
                NavigationLink{
                    
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

#Preview {
    LoginView()
}
