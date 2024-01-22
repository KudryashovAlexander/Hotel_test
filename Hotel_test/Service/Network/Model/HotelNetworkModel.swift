//
//  HotelNetworkModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import Foundation

// MARK: - HotelNetworkModel
struct HotelNetworkModel: Decodable {
    let id: Int
    let name, adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotelNetworkModel

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

// MARK: - AboutTheHotelNetworkModel
struct AboutTheHotelNetworkModel: Decodable {
    let description: String
    let peculiarities: [String]
}
