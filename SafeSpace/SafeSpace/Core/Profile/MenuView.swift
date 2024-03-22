//
//  MenuView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 11/03/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Ai
                Section {
                    HStack {
                        NavigationLink(destination: AIView()) {
                            Text("Ai Chat")
                                .fontWeight(.semibold)
                                .foregroundColor(.teal)
                                .frame(maxWidth: 300)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray.opacity(0.2)))
                        }
                    }
                }
                
                // Community
                Section {
                    HStack {
                        NavigationLink(destination: CommunityView()) {
                            Text("Community Feed")
                                .fontWeight(.semibold)
                                .foregroundColor(.teal)
                                .frame(maxWidth: 300)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray.opacity(0.2)))
                        }
                    }
                }
                
                // Professional help
                Section {
                    HStack {
                        NavigationLink(destination: ProfessionalView()) {
                            Text("Professional Help")
                                .fontWeight(.semibold)
                                .foregroundColor(.teal)
                                .frame(maxWidth: 300)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray.opacity(0.2)))
                        }
                    }
                }
            }
        }

    }
}

#Preview {
    MenuView()
}
