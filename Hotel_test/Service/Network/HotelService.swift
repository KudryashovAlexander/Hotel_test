//
//  HotelService.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

final class HotelService {
    private let networkClient: NetworkClient
    private(set) var hotel: HotelModel?
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchHotel() {
        networkClient.fetch(endPoint: .hotel) { [weak self] (result: Result<HotelModel,Error>) in
            guard let self else { return }
            switch result {
            case (.success(let hotelNetwork)):
                self.hotel = hotelNetwork
            case (.failure(let error)):
                print(error)
            }
        }
    }
}
