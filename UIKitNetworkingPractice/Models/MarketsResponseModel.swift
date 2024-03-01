//
//  MarketsResponseModel.swift
//  UIKitNetworkingPractice
//
//  Created by Varun Adit on 1/9/24.
//

import Foundation

struct MarketsResponseModel: Codable {
    let markets: [Markets]
    
    enum CodingKeys: String, CodingKey {
        case markets = "Markets"
    }
}

struct Markets: Codable {
    
    let label, name: String
    let price: Double

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case name = "Name"
        case price = "Price"
    }
}
