//
//  ContriesCodes.swift
//  biligoba
//
//  Created by Tacettin Pekin on 21.08.2023.
//

import SwiftUI

struct CountryCode: Identifiable {
    var id: Int
    var countryName: String
    var code: String
}


let countryCodes = [
    CountryCode(id: 1, countryName: "United States", code: "+1"),
    CountryCode(id: 2, countryName: "Canada", code: "+1"),
    CountryCode(id: 3, countryName: "India", code: "+91"),
    CountryCode(id: 4, countryName: "United Kingdom", code: "+44"),
    // Add more countries as needed
]
