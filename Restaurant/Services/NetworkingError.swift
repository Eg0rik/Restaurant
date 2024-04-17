//
//  APIError.swift
//  Restaurant
//
//  Created by MAC on 4/5/24.
//

import Foundation

extension NetworkingService {
    
    enum NetworkingError:LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
        case customString(description:String)
    }
}

extension NetworkingService.NetworkingError {
    var errorDescription: String {
        switch self {
            case .invalidUrl:
                "URL isn't valid"
            case .invalidStatusCode:
                "Status code falls into the wrong range"
            case .invalidData:
                "Response data is invalid"
            case .failedToDecode:
                "Failed to decode"
            case .custom(let err):
                "Something went wrong \(err.localizedDescription)"
            case .customString(let description):
                description
        }
    }
}
