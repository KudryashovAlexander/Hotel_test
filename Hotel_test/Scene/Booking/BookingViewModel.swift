//
//  BookingViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 20.12.2023.
//

import Foundation

protocol BookingViewModelProtocol: ObservableObject {
    var hotelName: String { get }
    var hotelAdress: String { get }
    var rating: Int { get }
    var ratingName: String { get }
    var departure: String { get }
    var arrivalCountry: String { get }
    var tourDateStart: String { get }
    var tourDateStop: String { get }
    var numberOfNights: Int { get }
    var room: String { get }
    var nutrition: String { get }
    var tourPrice: Int { get }
    var fuelCharge: Int { get }
    var serviceCharge: Int { get }
    var totalPrice: Int { get }
    var buyerMail: String { get }
    var buyerPhone: String { get }
    var tourists: [TouristModel] { get }
    func addTourist()
}

final class BookingViewModel: BookingViewModelProtocol {
    var hotelName: String = "Steigenberger Makadi"
    var hotelAdress: String = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    var rating: Int = 5
    var ratingName: String = "Превосходно"
    var departure: String = "Москва"
    var arrivalCountry: String = "Египет, Хургада"
    var tourDateStart: String = "19.09.2023"
    var tourDateStop: String = "27.09.2023"
    var numberOfNights: Int = 7
    var room: String = "Люкс номер с видом на море"
    var nutrition: String = "Все включено"
    var tourPrice: Int = 289400
    var fuelCharge: Int = 9300
    var serviceCharge: Int = 2150
    var totalPrice: Int {
        tourPrice + fuelCharge + serviceCharge
    }
    var buyerMail: String = ""
    var buyerPhone: String = ""
    @Published var tourists: [TouristModel] = [TouristModel(),TouristModel()]
    func addTourist() {
        tourists.append(TouristModel())
    }
    
}
