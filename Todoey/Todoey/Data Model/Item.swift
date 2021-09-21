//
//  Item.swift
//  Todoey
//
//  Created by Shorabh Dhandharia on 9/21/21.
//

import Foundation

class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}
