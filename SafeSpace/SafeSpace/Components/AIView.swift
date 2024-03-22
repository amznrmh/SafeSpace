//
//  AIView.swift
//  SafeSpace
//
//  Created by Aman Narmah on 18/03/2024.
//

//Not working due to problem while installing dependencies

import SwiftUI

struct AIView: View {
    @State var chatMessages: [ChatMessage] = ChatMessage.sampleMessages
    @State var MessageText: String = ""
    
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack{
                TextField("Enter a message", text: $MessageText) {
                    
                }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
    func messageView(message: ChatMessage) -> some View {
        HStack{
            if message.sender == .me{Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .gpt {Spacer()}
        }
    }
    func sendMessage(){
        MessageText = ""
        print(MessageText)
    }
}

struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}

extension ChatMessage {
    static var sampleMessages: [ChatMessage] {
        [
            ChatMessage(id: UUID().uuidString, content: "Sample message from me", dateCreated: Date(), sender: .me),
            ChatMessage(id: UUID().uuidString, content: "Sample message from Safe Space AI Chatbot", dateCreated: Date(), sender: .gpt),
            ChatMessage(id: UUID().uuidString, content: "Sample message from me", dateCreated: Date(), sender: .me),
            ChatMessage(id: UUID().uuidString, content: "Sample message from Safe Space AI Chatbot", dateCreated: Date(), sender: .gpt)
        ]
    }
}



















#Preview {
    AIView()
}
