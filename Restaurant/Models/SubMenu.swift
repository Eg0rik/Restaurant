//
//  SubMenuModel.swift
//  Restaurant
//
//  Created by MAC on 3/31/24.
//

import Foundation

struct SubMenu: Decodable {
    private let status: Bool
    let menuList: [Dish]
    
    init(status: Bool, subMenuItems: [Dish]) {
        self.status = status
        self.menuList = subMenuItems
    }
    
    static func example1() -> SubMenu {
        SubMenu(status: true, subMenuItems: [])
    }
}
