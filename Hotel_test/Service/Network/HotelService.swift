//
//  HotelService.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Combine
import Foundation

actor HotelService {
    nonisolated private let networkClient: NetworkClient
    nonisolated private let hotel: CurrentValueSubject<HotelModel?, Never>
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
        self.hotel = CurrentValueSubject(nil)
    }
    
    nonisolated func fetchHotel() {
        Task { await getHotel() }
    }
    
    private func getHotel() async {
        do {
            let hotelModel: HotelModel = try await networkClient.request(endPoint: .hotel)
            self.hotel.send(hotelModel)
        } catch let error {
            print("Error getting Hotel: \(error.localizedDescription)")
            self.hotel.send(nil)
        }
    }
}
