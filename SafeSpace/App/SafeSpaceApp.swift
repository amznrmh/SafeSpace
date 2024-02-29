//
//  SafeSpaceApp.swift
//  SafeSpace
//
//  Created by Aman Narmah on 06/01/2024.
//

import SwiftUI

@main
struct SafeSpaceApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
