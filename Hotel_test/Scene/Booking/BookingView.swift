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
    
    init(viewModel:BookingViewModel = BookingViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
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
    }
    
    private var hotelName: some View {
        VStack(alignment: .leading ,spacing:Constants.HotelName.spacingV) {
            HStack {
                RatingView(rating: viewModel.rating, score: viewModel.ratingName)
                Spacer()
            }
            Text(viewModel.hotelName)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
            Text(viewModel.hotelAdress)
                .font(.Medium.size14)
                .multilineTextAlignment(.leading)
                .foregroundColor(.hBlue)
        }
        .modify()
    }
    
    private var detail: some View {
        VStack(spacing:Constants.HotelName.spacingV) {
            detailView(name: L.Booking.Detail.departure,
                       detail: viewModel.departure)
            detailView(name: L.Booking.Detail.countryCity,
                       detail: viewModel.arrivalCountry)
            detailView(name: L.Booking.Detail.date,
                       detail: viewModel.tourDateStart + "-" + viewModel.tourDateStop )
            // TODO: -  Исправить
            detailView(name: L.Booking.Detail.numberDays,
                       detail: L.numberOfdays(viewModel.numberOfNights))
            detailView(name: L.Booking.Detail.hotel,
                       detail: viewModel.hotelName)
            detailView(name: L.Booking.Detail.apartment,
                       detail: viewModel.room)
            detailView(name: L.Booking.Detail.eating,
                       detail: viewModel.nutrition)
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
            priceView(name: L.Booking.Pay.tour, price: viewModel.tourPrice.priceString())
            priceView(name: L.Booking.Pay.fuelСollection, price: viewModel.fuelCharge.priceString())
            priceView(name: L.Booking.Pay.serviceFee, price: viewModel.serviceCharge.priceString())
            priceView(name: L.Booking.Pay.paid, price: viewModel.totalPrice.priceString())
        }
        .modify()
    }
    
    private var button: some View {
        VStack {
            Divider()
            ButtonView(text: L.Booking.button + " " + viewModel.totalPrice.priceString()) {
                coordinator.push(.resultOrder)
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

#Preview {
    BookingView()
}
