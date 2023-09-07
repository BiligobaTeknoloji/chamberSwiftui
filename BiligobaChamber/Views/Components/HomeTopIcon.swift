//
//  HomeTopIcon.swift
//  biligoba
//
//  Created by Tacettin Pekin on 25.08.2023.
//

import SwiftUI

struct HomeTopIcon: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        Image("top2")
            .resizable()
            .scaleEffect(2.2)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
            .allowsHitTesting(false)
            .offset(x:screenWidth * 0.16, y: screenHeight * -0.58)
    }
}

struct HomeTopIcon_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopIcon()
    }
}
