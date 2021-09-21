//
//  Category.swift
//  Todoey
//
//  Created by Shorabh Dhandharia on 9/21/21.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
