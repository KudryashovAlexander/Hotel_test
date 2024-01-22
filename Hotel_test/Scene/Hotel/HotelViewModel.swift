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
    
    private var hotelService: HotelService
    private var cancellables: Set<AnyCancellable>
    
    init(model:HotelModel, hotelService: HotelService) {
        self.model = model
        self.hotelService = hotelService
        self.cancellables = Set<AnyCancellable>()
        hotelService.fetchHotel()
    }
    
    func pressButton(_ completion: () -> Void) {
        //
        completion()
    }
}
