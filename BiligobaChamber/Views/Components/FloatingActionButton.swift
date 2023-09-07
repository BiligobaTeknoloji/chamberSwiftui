//
//  FloatingActionButton.swift
//  biligoba
//
//  Created by Tacettin Pekin on 24.08.2023.
//

import SwiftUI


struct FloatingActionButton: View {
    var body: some View {
        Button(action: {
            // Handle button tap here
        }) {
            ZStack {
                CustomCircleShape()
                    .fill(Color("iBlue"))
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
            .frame(width: 60, height: 60)
        }
    }
}

struct CustomCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let diameter = min(rect.width, rect.height)
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: diameter / 2, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: diameter / 2, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: -90), clockwise: false)

        return path
    }
}
