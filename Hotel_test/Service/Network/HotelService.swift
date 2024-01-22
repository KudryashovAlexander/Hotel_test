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
    nonisolated let hotel: CurrentValueSubject<HotelNetworkModel?, Never>
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
        self.hotel = CurrentValueSubject(nil)
    }
    
    nonisolated func fetchHotel() {
        Task { await getHotel() }
    }
    
    private func getHotel() async {
        do {
            let hotelModel: HotelNetworkModel = try await networkClient.request(endPoint: .hotel)
            self.hotel.send(hotelModel)
        } catch let error {
            print("Error getting Hotel: \(error.localizedDescription)")
            self.hotel.send(nil)
        }
    }
}
