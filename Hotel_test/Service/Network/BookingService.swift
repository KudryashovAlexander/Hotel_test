//
//  BookingService.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

final class BookingService {
    private let networkClient: NetworkClient
    private(set) var booking: BookingModel?
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchHotel() {
        networkClient.fetch(endPoint: .booking) { [weak self] (result: Result<BookingModel,Error>) in
            guard let self else { return }
            switch result {
            case (.success(let bookingNetwork)):
                self.booking = bookingNetwork
            case (.failure(let error)):
                print(error)
            }
        }
    }
}
