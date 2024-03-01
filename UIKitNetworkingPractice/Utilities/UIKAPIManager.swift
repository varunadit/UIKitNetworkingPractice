//
//  UIKAPIManager.swift
//  UIKitNetworkingPractice
//
//  Created by Varun Adit on 1/9/24.
//

import Foundation
import Combine

class UIKAPIManager {
    
    static let shared: UIKAPIManager = {
        let apiManager = UIKAPIManager()
        return apiManager
    }()
    
    private init() {
        
    }
    
    func fetchResponse(urlRequest: URLRequest) -> some Publisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse, 200...300 ~= httpResponse.statusCode else {
                    throw UIKNetworkError.invalidResponseCode
                }
                return data
            }
    }
}
