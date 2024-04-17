//
//  SubMenuItemModel.swift
//  Restaurant
//
//  Created by MAC on 3/31/24.
//

import Foundation

struct Dish: Decodable {
    let id,image, name, content,price, weight:String
    let spicy:String?
}

extension Dish: Identifiable {
   
}
