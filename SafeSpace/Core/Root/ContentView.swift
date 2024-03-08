//
//  ContentView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 06/01/2024.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        Group {
            if viewModel.userSession != nil {
                SettingsView()
            } else {
                LoginView()
            }
        }
    }
}
  
struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
