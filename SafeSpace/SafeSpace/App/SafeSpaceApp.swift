//
//  SafeSpaceApp.swift
//  SafeSpace
//
//  Created by Aman Narmah on 06/01/2024.
//

import SwiftUI
import Firebase

@main
struct SafeSpaceApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
     
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
