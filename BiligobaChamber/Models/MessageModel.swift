//
//  MessageModel.swift
//  BiligobaChamber
//
//  Created by Tacettin Pekin on 8.09.2023.
//

import Foundation

struct Message : Identifiable, Equatable {
    let id = UUID()
    let text : String
    let isCurrentUser : Bool
}
