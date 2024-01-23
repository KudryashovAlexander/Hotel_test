//
//  ApartmentViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

protocol ApartmentViewModelProtocol: ObservableObject, Hashable {
    var model: ApartmentModel { get }
    func pressButton(completion: () -> Void)
}

final class ApartmentViewModel: ApartmentViewModelProtocol {

    private(set) var model: ApartmentModel
    
    init(model: ApartmentModel) {
        self.model = model
    }
    
    // MARK: - Methods
    func pressButton(completion: () -> Void) {
        completion()
    }

    // MARK: - Hashable
    static func == (lhs: ApartmentViewModel, rhs: ApartmentViewModel) -> Bool {
        return lhs.model.id == rhs.model.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(model.id)
    }
}
