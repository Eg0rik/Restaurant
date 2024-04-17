//
//  NetWorkClass.swift
//  Restaurant
//
//  Created by MAC on 3/11/24.
//

import Foundation
import UIKit

final class NetworkingService {
    
    static let shared = NetworkingService()
    private init() { }
    
    func dataTask<T: Decodable>(_ endpoint: Endpoint,type: T.Type,completion: @escaping (Result<T,NetworkingError>) -> Void) {
        
        guard let url = endpoint.url else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data,response,error in
            
            if let error = self?.handleResponse(response: response, error: error) {
                completion(.failure(error))
            }
            
            if let data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(NetworkingError.custom(error: error)))
                }
            }
        }
        
        task.resume()
    }
    
    func downloadTask(_ endpoint: Endpoint,completion: @escaping (Result<URL,NetworkingError>) -> Void) {
        
        guard let url = endpoint.url else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let task = URLSession.shared.downloadTask(with: request) { localURL,response,error in
            
            if let error = self.handleResponse(response: response, error: error) {
                completion(.failure(error))
            }
            
            if let localURL {
                completion(.success(localURL))
            }
        }
        
        task.resume()
    }
    
    func dowloadImage(_ endpoint: Endpoint,completion: @escaping (Result<UIImage,NetworkingError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data,response,error in
            
            if let error = self?.handleResponse(response: response, error: error) {
                completion(.failure(error))
            }
            
            guard let data, let image = UIImage(data: data) else {
                completion(.failure(.customString(description: "func dowloadImage(): nil UIImage")))
                return
            }
            
            completion(.success(image))
        }
        
        task.resume()
    }
}

private extension NetworkingService {
    
    func buildRequest(from url: URL, methodType: Endpoint.MethodType) -> URLRequest {

        var request = URLRequest(url: url)
        
        switch methodType {
            case .GET:
                request.httpMethod = "GET"
            case .POST(let data):
                request.httpMethod = "POST"
                request.httpBody = data
        }
        return request
    }
    
    func handleResponse(response: URLResponse?,error:Error?) -> NetworkingError? {
        
        if let error = error as? URLError {
            return NetworkingError.custom(error: error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            return NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
        
        return nil
    }
}
