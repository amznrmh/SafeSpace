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
                
                InputView(text: $email,
                          title: "Full Name",
                          placeholder: "Enter Name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter Password..",
                          isSecureField: true)
                
                InputView(text: $password,
                          title: "Confirm Password",
                          placeholder: "Confirm your Password..",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
    }
}

#Preview {
    SignUpView()
}
