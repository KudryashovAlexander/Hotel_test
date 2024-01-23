//
//  BookingService.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Combine
import Foundation

actor BookingService {
    nonisolated private let networkClient: NetworkClient
    nonisolated let booking: CurrentValueSubject<BookingNetworkModel?, Never>
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
        self.booking = CurrentValueSubject(nil)
    }
    
    nonisolated func fetchBooking() {
        Task { await getBooking() }
    }
    
    private func getBooking() async {
        do {
            let bookingModel: BookingNetworkModel = try await networkClient.request(endPoint: .booking)
            self.booking.send(bookingModel)
        } catch let error {
            print("Error getting Hotel: \(error.localizedDescription)")
            self.booking.send(nil)
        }
    }
}
