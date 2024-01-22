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
    nonisolated let apartments: CurrentValueSubject<ApartmentsNetworkModel?, Never>
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
        self.apartments = CurrentValueSubject(nil)
    }
    
    nonisolated func fetchApartment() {
        Task { await getApartment() }
    }
    
    private func getApartment() async {
        do {
            let apartmentsModel: ApartmentsNetworkModel = try await networkClient.request(endPoint: .apartment)
            self.apartments.send(apartmentsModel)
        } catch let error {
            print("Error getting Hotel: \(error.localizedDescription)")
            self.apartments.send(nil)
        }
    }
}
