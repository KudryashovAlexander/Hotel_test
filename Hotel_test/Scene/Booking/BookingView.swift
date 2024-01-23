//
//  BookingView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var viewModel: BookingViewModel
    
    init(viewModel:BookingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if viewModel.isGetting == true {
            VStack {
                ScrollView {
                    VStack(spacing: Constants.spacingV) {
                        hotelName
                        detail
                        buyer
                        tourists
                        price
                    }
                }
                .background(Color.hLightGrayPhone)
                button
            }
            .modifyNavigation(title: L.Booking.title)
        } else {
            ProgressView()
                .modifyNavigation(title: "")
        }
        
    }
    
    private var hotelName: some View {
        VStack(alignment: .leading ,spacing:Constants.HotelName.spacingV) {
            HStack {
                RatingView(rating: viewModel.model.rating, score: viewModel.model.ratingName)
                Spacer()
            }
            Text(viewModel.model.hotelName)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
            Text(viewModel.model.hotelAdress)
                .font(.Medium.size14)
                .multilineTextAlignment(.leading)
                .foregroundColor(.hBlue)
        }
        .modify()
    }
    
    private var detail: some View {
        VStack(spacing:Constants.HotelName.spacingV) {
            detailView(name: L.Booking.Detail.departure,
                       detail: viewModel.model.departure)
            detailView(name: L.Booking.Detail.countryCity,
                       detail: viewModel.model.arrivalCountry)
            detailView(name: L.Booking.Detail.date,
                       detail: viewModel.model.tourDateStart + "-" + viewModel.model.tourDateStop )
            // TODO: -  Исправить
            detailView(name: L.Booking.Detail.numberDays,
                       detail: L.numberOfdays(viewModel.model.numberOfNights))
            detailView(name: L.Booking.Detail.hotel,
                       detail: viewModel.model.hotelName)
            detailView(name: L.Booking.Detail.apartment,
                       detail: viewModel.model.room)
            detailView(name: L.Booking.Detail.eating,
                       detail: viewModel.model.nutrition)
        }
        .modify()
    }
    
    private var buyer: some View {
        VStack(alignment: .leading) {
            Text(L.Booking.Byer.information)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
                .multilineTextAlignment(.leading)
            textFieldView(placeholder: L.Booking.Byer.phone,
                          binding: $viewModel.buyerPhone)
            textFieldView(placeholder: L.Booking.Byer.mail,
                          binding: $viewModel.buyerMail)
            Text(L.Booking.Byer.comment)
                .font(.Regular.size14)
                .foregroundColor(.hGray)
        }
        .modify()
    }
    
    private var tourists: some View {
        VStack {
            ForEach(viewModel.tourists.indices, id: \.self) { tourist in
                TouristView(number: tourist)
            }
            HStack {
                Text(L.Booking.Tourist.add)
                    .font(.Medium.size22)
                    .foregroundColor(.hBlack)
                Spacer()
                A.Icons.addTourist.swiftUIImage
                    .frame(width: Constants.Tourists.Image.widthHeight,
                           height: Constants.Tourists.Image.widthHeight)
                    .onTapGesture {
                        withAnimation(.linear(duration: Constants.Tourists.Image.duration)) {
                            viewModel.addTourist()
                        }
                    }
            }
            .modify()
        }
    }
    
    private var price: some View {
        VStack(spacing: Constants.Price.spacingV) {
            priceView(name: L.Booking.Pay.tour, price: viewModel.model.tourPrice)
            priceView(name: L.Booking.Pay.fuelСollection, price: viewModel.model.fuelCharge)
            priceView(name: L.Booking.Pay.serviceFee, price: viewModel.model.serviceCharge)
            priceView(name: L.Booking.Pay.paid, price: viewModel.model.totalPrice)
        }
        .modify()
    }
    
    private var button: some View {
        VStack {
            Divider()
            ButtonView(text: L.Booking.button + " " + viewModel.model.totalPrice) {
                viewModel.pressButton {
                    coordinator.push(.resultOrder)
                }
            }
            .padding(.horizontal, Constants.Button.paddingH)
        }
        .background(Color.white)
    }
    
    // MARK: - Methods
    private func detailView(name: String, detail: String) -> some View {
        HStack(alignment:.top) {
            Text(name)
                .font(.Regular.size16)
                .foregroundColor(.hGray)
            Spacer()
            Text(detail)
                .font(.Regular.size16)
                .foregroundColor(.hBlack)
                .frame(idealWidth: Constants.DetailView.width,
                       maxWidth: Constants.DetailView.width,
                       alignment: .leading)
        }
    }
    
    private func textFieldView(placeholder: String, binding: Binding<String>) -> some View {
        TextField(placeholder, text: binding)
            .font(.Regular.size16)
            .padding(.horizontal, Constants.TextField.paddingH)
            .frame(height: Constants.TextField.height)
            .background(Color.hLightGrayPhone)
            .cornerRadius(Constants.TextField.cornerRadius)
    }
    
    private func priceView(name: String, price: String) -> some View {
        HStack(alignment:.top) {
            Text(name)
                .font(.Regular.size16)
                .foregroundColor(.hGray)
            Spacer()
            Text(price)
                .font(.Regular.size16)
                .foregroundColor(.hBlack)
        }
    }
    // MARK: - Constants
    private enum Constants {
        static let spacingV: CGFloat = 8
        enum HotelName {
            static let spacingV: CGFloat = 8
        }
        enum Detail {
            static let spacingV: CGFloat = 16
        }
        enum Tourists {
            enum Image {
                static let widthHeight: CGFloat = 32
                static let duration: TimeInterval = 0.5
            }
        }
        enum Price {
            static let spacingV: CGFloat = 16
        }
        enum Button {
            static let paddingH: CGFloat = 16
        }
        enum DetailView {
            static let width: CGFloat = 203
        }
        enum TextField {
            static let paddingH: CGFloat = 16
            static let height: CGFloat = 53
            static let cornerRadius: CGFloat = 10
        }
    }
    
}

// #Preview {
//    BookingView()
// }
