//
//  HotelViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import Combine
import SwiftUI

protocol HotelViewModelProtocol: ObservableObject {
    var hotelName: String { get }
    var hotelAdress: String { get }
    var hotelMinimalPrice: String { get }
    var priceForIt: String { get }
    var rating: Int { get }
    var ratingName: String { get }
    var imageURLs: [URL] { get }
    var description: String { get }
    var peculiarities: [String] { get }
    func pressButton(_ completion: () -> Void)
}

final class HotelViewModel: HotelViewModelProtocol {
    
    private(set) var hotelName: String = "Steigenberger Makadi"
    private(set) var hotelAdress: String = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    private(set) var hotelMinimalPrice: String = "от \((134673).priceString())"
    private(set) var priceForIt: String = "за тур с перелетом"
    private(set) var rating: Int = 5
    private(set) var ratingName: String = "Превосходно"
    private(set) var imageURLs: [URL] = []
    private(set) var description: String = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
    private(set) var peculiarities: [String] = ["Бесплатный Wifi на всей территории отеля","1 км до пляжа","Бесплатный фитнес-клуб","20 км до аэропорта"]
    private(set) var mockImages = ["mockhotel1","mockhotel2","mockhotel3"]
    
    private var hotelService: HotelService
    private var cancellables: Set<AnyCancellable>
    
    init(hotelService: HotelService) {
        self.hotelService = hotelService
        self.cancellables = Set<AnyCancellable>()
        hotelService.fetchHotel()
    }
    
    func pressButton(_ completion: () -> Void) {
        //
        completion()
    }
    
    func bindOn() {
        hotelService.hotel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] hotelModel in
                if let hotelModel = hotelModel {
                    self?.hotelName = hotelModel.name
                    self?.hotelAdress = hotelModel.adress
                    self?.hotelMinimalPrice = hotelModel.minimalPrice.priceString()
                }
            }.store(in: &cancellables)
    }
    
}
