//
//  Item.swift
//  Todoey
//
//  Created by Yelim Kim on 7/2/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    @objc dynamic var dateCreated: Date?
}
