//
//  ContentView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 06/01/2024.
//
import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image(systemName: "AppIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding()

            TextField("Username", text: $username)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                .padding(.horizontal)

            Button("Login") {
                // Perform login authentication
                if validateLogin(username: username, password: password) {
                    // Login successful
                    // Add your code for successful login action
                    print("Login successful!")
                } else {
                    // Login failed
                    // Add your code for failed login action
                    print("Login failed!")
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }

    func validateLogin(username: String, password: String) -> Bool {
        // Simple validation logic, replace with your authentication logic
        let validUsername = "user"
        let validPassword = "password"

        return username == validUsername && password == validPassword
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
