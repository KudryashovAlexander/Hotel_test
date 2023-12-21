//
//  ApartmentsViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

protocol ApartmentsViewModelProtocol: ObservableObject {
    var titleName: String { get }
    var apartmentArray: [ApartmentViewModel] { get }
}

class ApartmentsViewModel: ApartmentsViewModelProtocol {
    private(set) var titleName: String = "Steigenberger Makadi"
    private(set) var apartmentArray: [ApartmentViewModel] = [ApartmentViewModel(), ApartmentViewModel()]
}
