//
//  ApartmentsViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

protocol ApartmentsViewModelProtocol: ObservableObject {
    var titleName: String { get }
    var apartments: [ApartmentViewModel] { get }
}

final class ApartmentsViewModel: ApartmentsViewModelProtocol {
    private(set) var titleName: String = "Steigenberger Makadi"
    private(set) var apartments: [ApartmentViewModel]
    
    init(titleName: String, apartments: [ApartmentViewModel]) {
        self.titleName = titleName
        self.apartments = apartments
    }
}
