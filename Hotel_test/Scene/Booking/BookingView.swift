//
//  BookingView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    @ObservedObject private var viewModel: BookingViewModel
    
    init(viewModel:BookingViewModel = BookingViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Text(L.Booking.title)
                .navigationTitle(L.Booking.title)
                .foregroundColor(.hBlack)
                .font(.Medium.size18)
            ScrollView {
                VStack(spacing: 8) {
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

    }
    
    private var hotelName: some View {
        VStack(alignment: .leading ,spacing:8) {
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
        VStack(spacing:16) {
            detailView(name: L.Booking.Detail.departure, detail: viewModel.departure)
            detailView(name: L.Booking.Detail.countryCity, detail: viewModel.arrivalCountry)
            detailView(name: L.Booking.Detail.date,
                       detail: viewModel.tourDateStart + "-" + viewModel.tourDateStop )
            // TODO: -  Исправить
            detailView(name: L.Booking.Detail.numberDays, detail: L.numberOfdays(viewModel.numberOfNights))
            detailView(name: L.Booking.Detail.hotel, detail: viewModel.hotelName)
            detailView(name: L.Booking.Detail.apartment, detail: viewModel.room)
            detailView(name: L.Booking.Detail.eating, detail: viewModel.nutrition)
        }
        .modify()
    }
    
    private var buyer: some View {
        VStack(alignment: .leading) {
            Text(L.Booking.Byer.information)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
                .multilineTextAlignment(.leading)
            textFieldView(placeholder: L.Booking.Byer.phone, binding: $viewModel.buyerPhone)
            textFieldView(placeholder: L.Booking.Byer.mail, binding: $viewModel.buyerMail)
            Text(L.Booking.Byer.comment)
                .font(.Regular.size14)
                .foregroundColor(.hGray)
        }
        .modify()
    }
    
    private var tourists: some View {
        VStack {
            TouristView(numberTourist: L.Booking.Tourist.first)
            TouristView(numberTourist: L.Booking.Tourist.second)
            HStack {
                Text(L.Booking.Tourist.add)
                    .font(.Medium.size22)
                    .foregroundColor(.hBlack)
                Spacer()
                A.Icons.addTourist.swiftUIImage
                    .frame(width: 32, height: 32)
                    .onTapGesture {
                        viewModel.addTourist()
                    }
                
            }
            .modify()
        }
    }
    
    private var price: some View {
        VStack(spacing: 16) {
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
                // TODO: - 
                print("press button")
            }
        }
        .background(Color.white)
    }
    
    private func detailView(name: String, detail: String) -> some View {
        HStack(alignment:.top) {
            Text(name)
                .font(.Regular.size16)
                .foregroundColor(.hGray)
            Spacer()
            Text(detail)
                .font(.Regular.size16)
                .foregroundColor(.hBlack)
                .frame(idealWidth: 203, maxWidth: 203, alignment: .leading)
        }
    }
    
    private func textFieldView(placeholder: String, binding: Binding<String>) -> some View {
        TextField(placeholder, text: binding)
            .font(.Regular.size16)
            .padding(.horizontal, 16)
            .frame(height:52)
            .background(Color.hLightGrayPhone)
            .cornerRadius(10)
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
    
}

#Preview {
    BookingView()
}
