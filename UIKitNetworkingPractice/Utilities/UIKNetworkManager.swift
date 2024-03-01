//
//  UIKNetworkManager.swift
//  UIKitNetworkingPractice
//
//  Created by Varun Adit on 1/9/24.
//

import Foundation
import Combine

class UIKNetworkManager {
    
    static let shared: UIKNetworkManager = {
        let networkInstance = UIKNetworkManager()
        return networkInstance
    }()
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private init(){
        
    }
    
    func fetchResponse<T: Codable>(type: T.Type, urlString: String) -> some Publisher<T?, Error> {
        
        guard let url = URL(string: urlString) else {
            return Fail(error: UIKNetworkError.invalidUrl)
                .eraseToAnyPublisher()
        }
        
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        
        return UIKAPIManager.shared.fetchResponse(urlRequest: urlRequest)
            .decode(type: T?.self, decoder: decoder)
            .mapError { error in
                switch error {
                case is DecodingError:
                    return UIKNetworkError.decodingError
                default:
                    return error
                }
                
            }
            .eraseToAnyPublisher()
    }
    
    
}

enum UIKNetworkError: Error {
    case invalidUrl
    case invalidResponseCode
    case decodingError
}
