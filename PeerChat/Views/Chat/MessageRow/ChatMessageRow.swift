//
//  ChatMessageRow.swift
//  PeerChat
//
//  Created by Lukas Hahn on 5/20/23.
//

import SwiftUI


struct ChatMessageRow: View {
    @EnvironmentObject private var model: Model
    let message: Message
    let geo:GeometryProxy
    
    var isCurrentUser:Bool {
        message.from.id == model.myPerson.id
    }
    
    var body: some View {
        
        HStack(){
            if isCurrentUser {
                Spacer(minLength: geo.size.width * 0.2)
            }
            if(!message.text.trimmingCharacters(in: .whitespacesAndNewlines).containsOnlyEmoji){
                Text(message.text)
                    .foregroundColor(isCurrentUser ? .white : .primary)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(
                        isCurrentUser ? .blue : Color(uiColor: .secondarySystemBackground),
                        in: RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            }else{
                Text(message.text.trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(.system(size: 40))
                    .multilineTextAlignment(isCurrentUser ? .trailing : .leading)
                    .padding()
            }
            if !isCurrentUser {
                Spacer(minLength: geo.size.width * 0.2)
            }
        }
    }
}
