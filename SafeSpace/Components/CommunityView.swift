//
//  CommunityView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 11/03/2024.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
       
        NavigationStack{
            
            ZStack {
                //AppColor.background.ignoresSafeArea()
                ScrollView{
                    VStack {
                        Text("Safe Space Community")
                            .font(.custom("Futura", size: 36))
                            .foregroundColor(.teal)
                            .fontWeight(.bold)
                            
                    }
                    LazyVStack (spacing: 32){
                        ForEach(0...10, id:\.self){ listing in
                            CommunityPostView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}
