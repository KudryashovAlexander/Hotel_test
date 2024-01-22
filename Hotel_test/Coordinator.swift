//
//  Coordinator.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.01.2024.
//

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
        let model = HotelModel(networkModel: MockNetworkData.hotel)
        let viewModel = HotelViewModel(model:model,
                                       hotelService: hotelService)
        HotelView(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func apartmentsView() -> some View {
        let apartmentsModels = MockNetworkData.apartments.apartment.map { ApartmentModel(networkModel: $0)}
        let apartmentsViewModels = apartmentsModels.map { ApartmentViewModel(model: $0) }
        let viewModel = ApartmentsViewModel(titleName: "Steigenberger Makadi",
                                            apartments: apartmentsViewModels)
        ApartmentsView(viewModel: viewModel)
    }
    
    @ViewBuilder
    private func bookingView() -> some View {
        let model = BookingModel(networkModel: MockNetworkData.booking)
        let viewModel = BookingViewModel(model: model)
        BookingView(viewModel: viewModel)
    }
}

enum Page: String, Identifiable {
    case hotel, apartment, booking, resultOrder
    var id: String {
        self.rawValue
    }
}
