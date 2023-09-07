//
//  ChatBubble.swift
//  biligoba
//
//  Created by Tacettin Pekin on 24.08.2023.
//

import SwiftUI

struct ChatBubble: View {
    var isSender: Bool
    var message: String
    
    var body: some View {
        HStack {
            if isSender {
                Spacer()
                Text(message)
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(self.bubbleShape)
                    .foregroundColor(.blue.opacity(0.5))
                    
            } else {
                Text(message)
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(self.bubbleShape)
                    .foregroundColor(.blue)
                    
                Spacer()
            }
        }
    }
    
    var bubbleShape: some View {
        RoundedRectangle(cornerRadius: 15)
    }
}


struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isSender: false, message: "hello how are you")
    }
}
