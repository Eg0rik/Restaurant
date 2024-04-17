//
//  DataState.swift
//  Restaurant
//
//  Created by MAC on 4/9/24.
//

import Foundation

enum DataState {
    case loading
    case success
    case error(NetworkingService.NetworkingError)
    
    var descriptoin:String {
        switch self {
            case .loading:
                "loading data"
            case .success:
                "success data"
            case .error(let error):
                error.errorDescription
        }
    }
}
