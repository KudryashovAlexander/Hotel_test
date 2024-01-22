//
//  ApartmentsModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.01.2024.
//

import Foundation

// MARK: - ApartmentsModel
struct ApartmentsModel {
    let apartment: [ApartmentModel]
    
    init(apartment: [ApartmentModel]) {
        self.apartment = apartment
    }
}

// MARK: - ApartmentModel
struct ApartmentModel {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    init(id: Int, name: String, price: Int, pricePer: String, peculiarities: [String], imageUrls: [String]) {
        self.id = id
        self.name = name
        self.price = price
        self.pricePer = pricePer
        self.peculiarities = peculiarities
        self.imageUrls = imageUrls
    }
}
