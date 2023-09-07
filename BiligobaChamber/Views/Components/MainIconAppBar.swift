//
//  MainIconAppBar.swift
//  biligoba
//
//  Created by Tacettin Pekin on 23.08.2023.
//

import SwiftUI

struct MainIconAppBar: View {
    var body: some View {
        MyIcon()
            .frame(width: 200, height: 100)
    }
}

struct MainIconAppBar_Previews: PreviewProvider {
    static var previews: some View {
        MainIconAppBar()
    }
}


struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.98447*width, y: 0))
        path.addLine(to: CGPoint(x: 0.98447*width, y: height))
        path.addLine(to: CGPoint(x: 0.36444*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0), control1: CGPoint(x: 0.16317*width, y: height), control2: CGPoint(x: 0, y: 0.55228*height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.98509*width, y: 0.87714*height))
        path.addCurve(to: CGPoint(x: 0.98509*width, y: 0.99909*height), control1: CGPoint(x: 0.98509*width, y: 0.97429*height), control2: CGPoint(x: 1.01864*width, y: 0.99909*height))
        path.addCurve(to: CGPoint(x: 0.88032*width, y: 0.86182*height), control1: CGPoint(x: 0.95153*width, y: 0.99909*height), control2: CGPoint(x: 0.88032*width, y: 0.96676*height))
        path.addCurve(to: CGPoint(x: 0.94107*width, y: 0.67182*height), control1: CGPoint(x: 0.88032*width, y: 0.75688*height), control2: CGPoint(x: 0.90752*width, y: 0.67182*height))
        path.addCurve(to: CGPoint(x: 0.98509*width, y: 0.87714*height), control1: CGPoint(x: 0.97462*width, y: 0.67182*height), control2: CGPoint(x: 0.96835*width, y: 0.77965*height))
        path.closeSubpath()
        return path
    }
}
