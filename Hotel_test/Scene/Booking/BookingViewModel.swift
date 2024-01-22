//
//  BookingViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 20.12.2023.
//

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
    
    @Published var tourists: [TouristModel] = [TouristModel(),TouristModel()]
    
    init(model: BookingModel) {
        self.model = model
    }
    func addTourist() {
        tourists.append(TouristModel())
    }
    func pressButton(_ completion: () -> Void) {
        completion()
    }
    
}
