//
//  EntryView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 11/03/2024.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        
        NavigationStack {
            
            HStack{
                
            }
            
            
            ZStack{
                ScrollView{
                    HStack(){
                        Text("Safe Space")
                            .font(.custom("Futura", size: 30))
                            .foregroundColor(.teal)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(30)
                            Spacer()
                    }
                    
                    LazyVStack (spacing: 32){
                        ForEach(0...10, id:\.self){
                            listing in PostView()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        }
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    EntryView()
}
