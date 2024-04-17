//
//  MenuItemModel.swift
//  Restaurant
//
//  Created by MAC on 3/31/24.
//

import Foundation

struct MenuSection: Decodable {
    let menuID: String
    let imageURL: String
    let name: String
    let count: Int
    
    enum CodingKeys:String,CodingKey {
        case menuID,name
        case count = "subMenuCount"
        case imageURL = "image"
    }
}
