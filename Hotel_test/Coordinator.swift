//
//  Coordinator.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.01.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .hotel:
            HotelView(viewModel: HotelViewModel())
        case .apartment:
            ApartmentsView(viewModel: ApartmentsViewModel())
        case .booking:
            BookingView(viewModel: BookingViewModel())
        case .resultOrder:
            ResultOrderView(viewModel: ResultOrderViewModel())
        }
    }
}

enum Page: String, Identifiable {
    case hotel, apartment, booking, resultOrder
    var id: String {
        self.rawValue
    }
}
