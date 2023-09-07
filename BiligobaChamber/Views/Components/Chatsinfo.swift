//
//  ChatView.swift
//  biligoba
//
//  Created by Ali Amer on 8/17/23.
//

import SwiftUI

struct ChatView: View {
    let name: String
    let message: String
    var body: some View {
        HStack {
            Circle()
                .frame(width: 60)
                .foregroundColor(.white)
            VStack (alignment: .leading){
                Text(name)
                    .padding(.leading, 5)
                    .font(.title3)
                    .foregroundColor(.primary)
                Text(message)
                    .padding(.leading, 5)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .badge(3)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(name: "Ali", message: "hello how are you today")
    }
}
