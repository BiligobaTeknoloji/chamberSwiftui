//
//  ConatacsData.swift
//  biligoba
//
//  Created by Tacettin Pekin on 24.08.2023.
//

import SwiftUI

struct Contact: Identifiable {
    var id: Int
    var name: String
    var message: String
    var staus: Bool
}

var contacts = [
    Contact(id: 1, name: "ali", message: "how are you today", staus: false),
    Contact(id: 2, name: "ahmed", message: "hey", staus: true),
    Contact(id: 3, name: "abdulallah", message: "hello there", staus: false),
    Contact(id: 4, name: "biligoba", message: "how is the work going", staus: false),
    Contact(id: 5, name: "ali", message: "how are you today", staus: false),
    Contact(id: 1, name: "ali", message: "how are you today", staus: false),
    Contact(id: 2, name: "ahmed", message: "hey", staus: true),
    Contact(id: 3, name: "abdulallah", message: "hello there", staus: false),
    Contact(id: 4, name: "biligoba", message: "how is the work going", staus: false),
    Contact(id: 5, name: "ali", message: "how are you today", staus: false),
    Contact(id: 1, name: "ali", message: "how are you today", staus: false),
    Contact(id: 2, name: "ahmed", message: "hey", staus: true),
    Contact(id: 3, name: "abdulallah", message: "hello there", staus: false),
    Contact(id: 4, name: "biligoba", message: "how is the work going", staus: false),
    Contact(id: 5, name: "ali", message: "how are you today", staus: false),
 ]
