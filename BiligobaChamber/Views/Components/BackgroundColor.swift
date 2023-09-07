//
//  BackgroundColor.swift
//  biligoba
//
//  Created by Ali Amer on 8/20/23.
//

import SwiftUI

struct BackgroundColor: View {
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("first"),Color("first") ,Color("second"), Color("first")]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        gradient.edgesIgnoringSafeArea(.all)
    }
}
