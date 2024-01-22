//
//  HotelModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.01.2024.
//

import Foundation

// MARK: - HotelModel
struct HotelModel {
    let id: Int
    let name, adress: String
    let minimalPrice: String
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let description: String
    let peculiarities: [String]
    
    init(networkModel: HotelNetworkModel){
        self.id = networkModel.id
        self.name = networkModel.name
        self.adress = networkModel.adress
        self.minimalPrice = "от \((networkModel.minimalPrice).priceString())"
        self.priceForIt = networkModel.priceForIt
        self.rating = networkModel.rating
        self.ratingName = networkModel.ratingName
        self.imageUrls = networkModel.imageUrls
        self.description = networkModel.aboutTheHotel.description
        self.peculiarities = networkModel.aboutTheHotel.peculiarities
    }
}
