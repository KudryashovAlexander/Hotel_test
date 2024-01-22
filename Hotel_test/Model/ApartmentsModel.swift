//
//  ApartmentsModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.01.2024.
//

import Foundation

// MARK: - ApartmentsModel
struct ApartmentsModel {
    let apartments: [ApartmentModel]
    
    init(networkModel: [ApartmentNetworkModel]) {
        self.apartments = networkModel.map { ApartmentModel(networkModel: $0)}
    }
}

// MARK: - ApartmentModel
struct ApartmentModel {
    let id: Int
    let name: String
    let price: String
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    init(networkModel: ApartmentNetworkModel) {
        self.id = networkModel.id
        self.name = networkModel.name
        self.price = networkModel.price.priceString()
        self.pricePer = networkModel.pricePer
        self.peculiarities = networkModel.peculiarities
        self.imageUrls = networkModel.imageUrls
    }
}
