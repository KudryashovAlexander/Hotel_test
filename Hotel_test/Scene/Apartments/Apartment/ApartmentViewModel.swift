//
//  ApartmentViewModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

protocol ApartmentViewModelProtocol: ObservableObject, Hashable {
    var id: Int { get }
    var name: String { get }
    var price: Int { get }
    var pricePer: String { get }
    var peculiarities: [String] { get }
    var imageUrls: [String] { get }
    func checkNumber()
}

class ApartmentViewModel: ApartmentViewModelProtocol {
    static func == (lhs: ApartmentViewModel, rhs: ApartmentViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    private(set) var id: Int = 0
    @Published private(set) var name: String = "Стандартный номер с видом на бассейн"
    @Published private(set) var price: Int = 186600
    @Published private(set) var pricePer: String = "за 7 ночей с перелетом"
    @Published private(set) var peculiarities: [String] = ["Включен только завтрак",
                                                           "Кондиционер"]
    //@Published private(set) var imageUrls: [String] = ["https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg",
//                                                       "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=",
//                                                       "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg"]
    
    @Published private(set) var imageUrls: [String] = ["apartment1",
                                                       "apartment2",
                                                       "apartment3",
                                                       "apartment4"]
    func checkNumber() {
        // TODO: -
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
