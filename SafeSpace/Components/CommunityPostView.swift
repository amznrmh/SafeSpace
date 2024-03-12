//
//  CommunityPostView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 12/03/2024.
//

import SwiftUI

struct CommunityPostView: View {
    var body: some View {
        VStack(spacing:8){
            //images
            Rectangle()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack{
                VStack(alignment: .leading){
                  Text("Aman Narmah")
                        .fontWeight(.semibold)
                        .font(.custom("Futura", size: 15))
                        .foregroundColor(.teal)
               
                    
                    Text("London, UK")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Text("Posted")
                            .foregroundColor(.gray)
                            
                        Text("12:42")
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2){
                    Image(systemName: "text.bubble")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                      
                        .padding()
                    
                    
                    
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                    
                        .padding()
                }
            }
            
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    CommunityPostView()
}
