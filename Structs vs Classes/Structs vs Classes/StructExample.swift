//
//  StructExample.swift
//  Structs vs Classes
//
//  Created by Yelim Kim on 19/2/22.
//

import Foundation

struct StructHero {
    var name: String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}

