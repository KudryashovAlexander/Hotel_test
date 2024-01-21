//
//  ApartmentService.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Combine
import Foundation

actor ApartmentService {
    nonisolated private let networkClient: NetworkClient
    nonisolated private let apartment: CurrentValueSubject<ApartmentModel?, Never>
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
        self.apartment = CurrentValueSubject(nil)
    }
    
    nonisolated func fetchApartment() {
        Task { await getApartment() }
    }
    
    private func getApartment() async {
        do {
            let apartmentModel: ApartmentModel = try await networkClient.request(endPoint: .apartment)
            self.apartment.send(apartmentModel)
        } catch let error {
            print("Error getting Hotel: \(error.localizedDescription)")
            self.apartment.send(nil)
        }
    }
}
