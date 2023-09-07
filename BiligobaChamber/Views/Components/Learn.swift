//
//  Learn.swift
//  BiligobaChamber
//
//  Created by Tacettin Pekin on 5.09.2023.
//

import SwiftUI

struct Learn: View {
    @State private var text = ""
    var body: some View {
        TextField("Email", text: $text)
    }
}

struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn()
    }
}
