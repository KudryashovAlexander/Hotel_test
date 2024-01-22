//
//  MockNetworkData.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.01.2024.
//

import Foundation

enum MockNetworkData {
    static let hotel = hotelNetworkModel
    static let apartments = apartmentNetworkModel
    static let booking = bookingNetworkModel
}

fileprivate let hotelNetworkModel = HotelNetworkModel(id: 1,
                                          name: "Steigenberger Makadi",
                                          adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                                          minimalPrice: 134673,
                                          priceForIt: "за тур с перелетом",
                                          rating: 5,
                                          ratingName: "Превосходно",
                                          imageUrls: [],
                                          aboutTheHotel: AboutTheHotelNetworkModel(description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
                                                                                   peculiarities: ["Бесплатный Wifi на всей территории отеля","1 км до пляжа","Бесплатный фитнес-клуб","20 км до аэропорта"]))

private let apartmentNetworkModel1 = ApartmentNetworkModel(id: 0,
                                                  name: "Стандартный номер с видом на бассейн",
                                                  price: 186600,
                                                  pricePer: "за 7 ночей с перелетом",
                                                  peculiarities: ["Включен только завтрак",
                                                                  "Кондиционер"],
                                                  imageUrls: [])
private let apartmentNetworkModel2 = ApartmentNetworkModel(id: 1,
                                                  name: "Делюкс номер с видом на бассейн",
                                                  price: 198600,
                                                  pricePer: "за 7 ночей с перелетом",
                                                  peculiarities: ["Все включено",
                                                                  "Кондиционер"],
                                                  imageUrls: [])

fileprivate let apartmentNetworkModel = ApartmentsNetworkModel(apartment: [apartmentNetworkModel1, apartmentNetworkModel2])

fileprivate let bookingNetworkModel = BookingNetworkModel(id: 0,
                                              hotelName: "Steigenberger Makadi",
                                              hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                                              horating: 5,
                                              ratingName: "Превосходно",
                                              departure: "Москва",
                                              arrivalCountry: "Египет, Хургада",
                                              tourDateStart: "19.09.2023",
                                              tourDateStop: "27.09.2023",
                                              numberOfNights: 7,
                                              room: "Люкс номер с видом на море",
                                              nutrition: "Все включено",
                                              tourPrice: 289400,
                                              fuelCharge: 9300,
                                              serviceCharge: 2150)
