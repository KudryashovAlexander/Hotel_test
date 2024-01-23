//
//  BookingViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 20.12.2023.
//

import Combine
import Foundation

protocol BookingViewModelProtocol: ObservableObject {
    var model: BookingModel { get }
    var buyerMail: String { get }
    var buyerPhone: String { get }
    var tourists: [TouristModel] { get }
    func addTourist()
    func pressButton(_ completion: () -> Void)
}

final class BookingViewModel: BookingViewModelProtocol {
    private(set) var model: BookingModel
    var buyerMail: String = ""
    var buyerPhone: String = ""
    private var bookingService: BookingService
    
    @Published var tourists: [TouristModel] = [TouristModel(),TouristModel()]
    @Published var isGetting: Bool?
    private var cancellables: Set<AnyCancellable>
    
    init(model: BookingModel, bookingService: BookingService) {
        self.model = model
        self.cancellables = Set<AnyCancellable>()
        self.bookingService = bookingService
        bindOn()
        bookingService.fetchBooking()
    }
    
    func addTourist() {
        tourists.append(TouristModel())
    }
    
    func pressButton(_ completion: () -> Void) {
        completion()
    }
    
    func bindOn() {
        bookingService.booking
            .receive(on: DispatchQueue.main)
            .sink { [weak self] bookingNetworkModel in
                if let bookingNetworkModel = bookingNetworkModel {
                    self?.model = BookingModel(networkModel: bookingNetworkModel)
                    self?.isGetting = true
                }
            }.store(in: &cancellables)
    }
    
}
