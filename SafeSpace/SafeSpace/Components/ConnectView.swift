//
//  ConnectView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 18/03/2024.
//

import SwiftUI

struct ConnectView: View {
    var body: some View {
        
        List{
            
            //display picture instead of initials
            Text("LT")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width:72,height: 72)
                .background(Color(.systemGray3))
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 4){
        
                Text("Specialised Field")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.top,4)
                
                HStack(spacing: 2){
                    Image(systemName: "text.bubble")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .padding(5)
                    
                    
                }
                
            }
        }
        
    }
}

#Preview {
    ConnectView()
}
