//
//  support_NetWorkManager.swift
//  Restaurant
//
//  Created by MAC on 4/3/24.
//

import Foundation

enum Endpoint {
    case menu
    case subMenu(menuID:String)
    case image(imagePath:String)
}

extension Endpoint {
    
    var host:String { "vkus-sovet.ru" }
    
    var path:String {
        switch self {
            case .menu:
                "/api/getMenu.php"
            case .subMenu:
                "/api/getSubMenu.php"
            case .image(let imagePath):
                imagePath
        }
    }
    
    var queryItems: [String:String]? {
        switch self {
            case .subMenu(let menuID):
                ["menuID":menuID]
            default:
                nil
        }
    }
}

extension Endpoint {
    var url:URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        var requestQueryItems = [URLQueryItem]()
        
        queryItems?.forEach {
            requestQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
        }
        
        urlComponents.queryItems = requestQueryItems
        
        return urlComponents.url
    }
}





//MARK: - for future
extension Endpoint {
    enum MethodType: Equatable {
        case GET
        case POST(data: Data?)
    }
    
    var methodType: MethodType {
        switch self {
            default:
                return .GET
        }
    }
}
