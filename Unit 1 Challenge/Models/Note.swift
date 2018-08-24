//
//  Notes.swift
//  Unit 1 Challenge
//
//  Created by Eric Andersen on 8/24/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class Note: Equatable, Codable {
    
    var title: String
    var bodyText: String
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        if lhs.title != rhs.title { return false }
        if lhs.bodyText != rhs.bodyText { return false }
        return true
    }
}
