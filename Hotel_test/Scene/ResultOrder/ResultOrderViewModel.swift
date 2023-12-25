//
//  ResultOrderViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import Foundation

protocol ResultOrderProtocol: ObservableObject {
    var titleName: String { get }
    var imageName: String { get }
    var orderResult: String { get }
    var orderComment: String { get }
    var buttonName : String { get }
}

final class ResultOrderViewModel: ResultOrderProtocol {
    @Published var titleName: String = L.Order.title
    @Published var imageName: String = "sucessOrder"
    @Published var orderResult: String = L.Order.result
    @Published var orderComment: String = L.Order.comment
    @Published var buttonName: String = L.Order.button
}
