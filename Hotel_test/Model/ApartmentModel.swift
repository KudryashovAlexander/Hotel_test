//
//  ApartmentModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 20.12.2023.
//

import Foundation

// MARK: - Apartments
struct ApartmentsModel: Decodable {
    let apartment: [ApartmentModel]
}

// MARK: - Apartment
struct ApartmentModel: Decodable {
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
