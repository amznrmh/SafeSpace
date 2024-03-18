//
//  ProfessionalView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 11/03/2024.
//

import SwiftUI

struct ProfessionalView: View {
    var body: some View {
     
        Spacer()
        
        NavigationStack{
            
            ZStack {
                //AppColor.background.ignoresSafeArea()
                ScrollView{
                    VStack {
                        Text("Connect with Professionals")
                            .font(.custom("Futura", size: 36))
                            .foregroundColor(.teal)
                            .fontWeight(.bold)
                            
                    }
                    LazyVStack (spacing: -170){
                        ForEach(0...10, id:\.self){ listing in
                            ConnectView()
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
    ProfessionalView()
}
