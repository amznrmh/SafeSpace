//
//  PostView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 11/03/2024.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack (spacing : 8) {
            Rectangle()
                .frame(height : 210)
                .frame(width: 350)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            HStack{
                VStack(spacing: 4) {
                    
                    Text("Brunel University")
                    Text("02/03/24")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                HStack{
                    
                }
                
            }
        }
    }
}

#Preview {
    PostView()
}
