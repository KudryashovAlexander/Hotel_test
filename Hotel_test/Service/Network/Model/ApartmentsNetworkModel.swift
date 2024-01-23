//
//  ApartmentNetworkModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 20.12.2023.
//

import Foundation

// MARK: - ApartmentsNetworkModel
struct ApartmentsNetworkModel: Decodable {
    let rooms: [ApartmentNetworkModel]
}

// MARK: - ApartmentNetworkModel
struct ApartmentNetworkModel: Decodable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
