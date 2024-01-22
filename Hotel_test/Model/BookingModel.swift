//
//  BookingModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.01.2024.
//

import Foundation

// MARK: - BookingModel
struct BookingModel {
    let id: Int
    let hotelName, hotelAdress: String
    let rating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: String
    let totalPrice: String
    
    init(networkModel: BookingNetworkModel) {
        self.id = networkModel.id
        self.hotelName = networkModel.hotelName
        self.hotelAdress = networkModel.hotelAdress
        self.rating = networkModel.horating
        self.ratingName = networkModel.ratingName
        self.departure = networkModel.departure
        self.arrivalCountry = networkModel.arrivalCountry
        self.tourDateStart = networkModel.tourDateStart
        self.tourDateStop = networkModel.tourDateStop
        self.numberOfNights = networkModel.numberOfNights
        self.room = networkModel.room
        self.nutrition = networkModel.nutrition
        self.tourPrice = networkModel.tourPrice.priceString()
        self.fuelCharge = networkModel.fuelCharge.priceString()
        self.serviceCharge = networkModel.serviceCharge.priceString()
        self.totalPrice = (networkModel.tourPrice +
                           networkModel.fuelCharge +
                           networkModel.serviceCharge).priceString()
    }
}
