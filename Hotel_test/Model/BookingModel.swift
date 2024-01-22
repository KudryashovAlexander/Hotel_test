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
    let horating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Int
    
    init(id: Int,
         hotelName: String,
         hotelAdress: String,
         horating: Int,
         ratingName: String,
         departure: String,
         arrivalCountry: String,
         tourDateStart: String,
         tourDateStop: String,
         numberOfNights: Int,
         room: String,
         nutrition: String,
         tourPrice: Int,
         fuelCharge: Int,
         serviceCharge: Int)
    {
        self.id = id
        self.hotelName = hotelName
        self.hotelAdress = hotelAdress
        self.horating = horating
        self.ratingName = ratingName
        self.departure = departure
        self.arrivalCountry = arrivalCountry
        self.tourDateStart = tourDateStart
        self.tourDateStop = tourDateStop
        self.numberOfNights = numberOfNights
        self.room = room
        self.nutrition = nutrition
        self.tourPrice = tourPrice
        self.fuelCharge = fuelCharge
        self.serviceCharge = serviceCharge
    }
}
