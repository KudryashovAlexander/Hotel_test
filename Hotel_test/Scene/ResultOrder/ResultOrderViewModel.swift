//
//  ResultOrderViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import Foundation

protocol ResultOrderProtocol: ObservableObject {
    var imageName: String { get }
    var orderResult: String { get }
    var orderComment: String { get }
    var buttonName : String { get }
}

class ResultOrderViewModel: ResultOrderProtocol {
    @Published var imageName: String = "sucessOrder"
    @Published var orderResult: String = "Ваш заказ принят в работу"
    @Published var orderComment: String = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    @Published var buttonName: String = "Супер!"
}
