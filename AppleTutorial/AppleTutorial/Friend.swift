//
//  Friend.swift
//  AppleTutorial
//
//  Created by Tanmay Avinash Dabhade on 8/9/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    let name: String
    let birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}


