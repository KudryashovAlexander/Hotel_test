//
//  BookingView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    @State private var phone: String = ""
    @State private var mail: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                hotelName
                detail
                buyer
                TouristView(numberTourist: L.Booking.Tourist.first)
                TouristView(numberTourist: L.Booking.Tourist.second)
                price
            }
        }
        .background(Color.hGray)
    }
    
    private var hotelName: some View {
        VStack(alignment: .leading ,spacing:8) {
            HStack {
                RatingView(rating: 5, score: "Превосходно")
                Spacer()
            }
            Text("Steigenberger Makadi")
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
            Text("Madinat Makadi, Safaga Road, Makadi Bay, Египет")
                .font(.Medium.size14)
                .multilineTextAlignment(.leading)
                .foregroundColor(.hBlue)
        }
        .modify()
    }
    
    private var detail: some View {
        VStack(spacing:16) {
            detailView(name: L.Booking.Detail.departure, detail: "Санкт-Петербург")
            detailView(name: L.Booking.Detail.countryCity, detail: "Египет, Хургада")
            detailView(name: L.Booking.Detail.date, detail: "19.09.2023 – 27.09.2023")
            detailView(name: L.Booking.Detail.numberDays, detail: "7 ночей")
            detailView(name: L.Booking.Detail.hotel, detail: "Steigenberger Makadi")
            detailView(name: L.Booking.Detail.apartment, detail: "Стандартный с видом на бассейн или сад")
            detailView(name: L.Booking.Detail.eating, detail: "Все включено")
        }
        .modify()
    }
    
    private var buyer: some View {
        VStack(alignment: .leading) {
            Text(L.Booking.Byer.information)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
                .multilineTextAlignment(.leading)
            textFieldView(placeholder: L.Booking.Byer.phone, binding: $phone)
            textFieldView(placeholder: L.Booking.Byer.mail, binding: $mail)
            Text(L.Booking.Byer.comment)
                .font(.Regular.size14)
                .foregroundColor(.hGray)
        }
        .modify()
    }
    
    private var price: some View {
        VStack(spacing: 16) {
            priceView(name: L.Booking.Pay.tour, price: "186 600Р")
            priceView(name: L.Booking.Pay.fuelСollection, price: "9 300Р")
            priceView(name: L.Booking.Pay.serviceFee, price: "2 136Р")
            priceView(name: L.Booking.Pay.paid, price: "198 036Р")
        }
        .modify()
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
