//
//  Coordinator.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.01.2024.
//
import Combine
import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    private var networkClient: NetworkClient
    private var hotelService: HotelService
    private var apartmentService: ApartmentService
    private var bookingService: BookingService
    
    init(networkClient: NetworkClient =  NetworkClient()) {
        self.networkClient = networkClient
        self.hotelService = HotelService(networkClient: networkClient)
        self.apartmentService = ApartmentService(networkClient: networkClient)
        self.bookingService = BookingService(networkClient: networkClient)
    }
    
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
            hotelView()
        case .apartment:
            apartmentsView()
        case .booking:
            bookingView()
        case .resultOrder:
            ResultOrderView(viewModel: ResultOrderViewModel())
        }
    }
    
    @ViewBuilder
    private func hotelView() -> some View {
        let viewModel = HotelViewModel(hotelService: hotelService)
        HotelView(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func apartmentsView() -> some View {
        let viewModel = ApartmentsViewModel(apartmentService: apartmentService)
        ApartmentsView(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func bookingView() -> some View {
        let viewModel = BookingViewModel(bookingService: bookingService)
        BookingView(viewModel: viewModel)
    }

}

enum Page: String, Identifiable {
    case hotel, apartment, booking, resultOrder
    var id: String {
        self.rawValue
    }
}
