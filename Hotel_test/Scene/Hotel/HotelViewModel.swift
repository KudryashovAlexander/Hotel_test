//
//  HotelViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import Combine
import SwiftUI

protocol HotelViewModelProtocol: ObservableObject {
    var model: HotelModel { get }
    func pressButton(_ completion: () -> Void)
}

final class HotelViewModel: HotelViewModelProtocol {
    
    private(set) var model: HotelModel
    @Published var isGetting: Bool?
    
    private var hotelService: HotelService
    private var cancellables: Set<AnyCancellable>
    
    init(model:HotelModel, hotelService: HotelService) {
        self.model = model
        self.hotelService = hotelService
        self.cancellables = Set<AnyCancellable>()
        bindOn()
        hotelService.fetchHotel()
    }
    
    func pressButton(_ completion: () -> Void) {
        completion()
    }
    
    func bindOn() {
        hotelService.hotel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] hotelNetworkModel in
                if let hotelNetworkModel = hotelNetworkModel {
                    self?.model = HotelModel(networkModel: hotelNetworkModel)
                    self?.isGetting = true
                }
            }.store(in: &cancellables)
    }
}
