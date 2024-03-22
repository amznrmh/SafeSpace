//
//  HomePageView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 11/03/2024.
//

import SwiftUI

struct MainView: View {
    
    
    
    
    var body: some View {
        TabView {
            
                 EntryView()
                       .tabItem{
                           Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                           Text("Entries")
                       }
                   
                MenuView()
                        .tabItem{
                            Image(systemName: "list.bullet.circle")
                            Text("Menu")
            }
            
            
                SettingsView()
                        .tabItem{
                        Image(systemName: "person.crop.circle.fill")
                        Text("Settings")
                         }
        
               }
               //changing tab lable colour
        .tint(.blue)
               
    }
}

#Preview {
    MainView()
}
