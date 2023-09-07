//
//  RectangleButton.swift
//  biligoba
//
//  Created by Tacettin Pekin on 25.08.2023.
//

import SwiftUI

struct RectangleButton: View {
    @Binding var isExtended: Bool

    let extendedWidth: CGFloat = 120.0
    let collapsedWidth: CGFloat = 30.0

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                isExtended.toggle()
            }
        }) {
            ZStack {
                if isExtended {
                    HStack(spacing: 15) {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.black)
                        Image(systemName: "video.fill")
                            .foregroundColor(.black)
                        Image(systemName: "mic.fill")
                            .foregroundColor(.black)
                        Image(systemName: "location.fill")
                            .foregroundColor(.black)
                        Image(systemName: "photo.on.rectangle.angled")
                            .foregroundColor(.black)
                        Image(systemName: "doc.fill")
                            .foregroundColor(.black)
                    }
//                    .frame(width: extendedWidth)
                    .transition(.move(edge: .leading))
                } else {
//                    HStack {
//                        Circle().frame(width: 5, height: 5)
//                        Circle().frame(width: 5, height: 5)
//                        Circle().frame(width: 5, height: 5)
//                    }
//                    .frame(width: collapsedWidth)
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .font(.title)
                        .transition(.opacity)
                }
            }
            .padding(.all, 10)
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}



struct RectangleButton_Previews: PreviewProvider {
    @State static private var isExtended = true
    
    static var previews: some View {
        RectangleButton(isExtended: $isExtended)
    }
}

