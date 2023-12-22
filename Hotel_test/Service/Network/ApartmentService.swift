//
//  ApartmentService.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

final class ApartmentService {
    private let networkClient: NetworkClient
    private(set) var apartments: ApartmentsModel?
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchHotel() {
        networkClient.fetch(endPoint: .apartment) { [weak self] (result: Result<ApartmentsModel,Error>) in
            guard let self else { return }
            switch result {
            case (.success(let apartmentsNetwork)):
                self.apartments = apartmentsNetwork
            case (.failure(let error)):
                print(error)
            }
        }
    }
}
