//
//  ApartmentsViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Combine
import Foundation

protocol ApartmentsViewModelProtocol: ObservableObject {
    var titleName: String { get }
    var isGetting: Bool? { get }
    var apartments: [ApartmentViewModel] { get }
}

final class ApartmentsViewModel: ApartmentsViewModelProtocol {
    private(set) var titleName: String = "Steigenberger Makadi"
    private(set) var apartments: [ApartmentViewModel]
    private var apartmentService: ApartmentService
    
    @Published var isGetting: Bool?
    private var cancellables: Set<AnyCancellable>
    
    init(apartments: [ApartmentViewModel], apartmentService: ApartmentService) {
        self.apartments = apartments
        self.apartmentService = apartmentService
        self.cancellables = Set<AnyCancellable>()
        bindOn()
        apartmentService.fetchApartment()
    }
    
    func bindOn() {
        apartmentService.apartments
            .receive(on: DispatchQueue.main)
            .sink { [weak self] apartmentsNetworkModel in
                if let apartmentsNetworkModel = apartmentsNetworkModel {
                    let apartmentModels = apartmentsNetworkModel.rooms.map {
                        ApartmentModel(networkModel: $0) }
                    self?.apartments = apartmentModels.map { ApartmentViewModel(model: $0)}
                    self?.isGetting = true
                }
            }.store(in: &cancellables)
    }
}
