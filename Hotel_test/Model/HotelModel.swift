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
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotelModel
    
    init(id: Int,
         name: String,
         adress: String,
         minimalPrice: Int,
         priceForIt: String,
         rating: Int,
         ratingName: String,
         imageUrls: [String],
         aboutTheHotel: AboutTheHotelModel)
    {
        self.id = id
        self.name = name
        self.adress = adress
        self.minimalPrice = minimalPrice
        self.priceForIt = priceForIt
        self.rating = rating
        self.ratingName = ratingName
        self.imageUrls = imageUrls
        self.aboutTheHotel = aboutTheHotel
    }
}

// MARK: - AboutTheHotelModel
struct AboutTheHotelModel {
    let description: String
    let peculiarities: [String]
    
    init(description: String, peculiarities: [String]) {
        self.description = description
        self.peculiarities = peculiarities
    }
}
