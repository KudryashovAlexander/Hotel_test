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
                TouristView(numberTourist: "Первый турист")
                TouristView(numberTourist: "Второй турист")
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
            detailView(name: "Вылет из", detail: "Санкт-Петербург")
            detailView(name: "Страна, город", detail: "Египет, Хургада")
            detailView(name: "Даты", detail: "19.09.2023 – 27.09.2023")
            detailView(name: "Кол-во ночей", detail: "7 ночей")
            detailView(name: "Отель", detail: "Steigenberger Makadi")
            detailView(name: "Номер", detail: "Стандартный с видом на бассейн или сад")
            detailView(name: "Питание", detail: "Все включено")
        }
        .modify()
    }
    
    private var buyer: some View {
        VStack(alignment: .leading) {
            Text("Информация о покупателе")
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
                .multilineTextAlignment(.leading)
            textFieldView(placeholder: "Номер телефона", binding: $phone)
            textFieldView(placeholder: "Почта", binding: $mail)
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .font(.Regular.size14)
                .foregroundColor(.hGray)
        }
        .modify()
    }
    
    private var price: some View {
        VStack(spacing: 16) {
            priceView(name: "Тур", price: "186 600Р")
            priceView(name: "Топливный сбор", price: "9 300Р")
            priceView(name: "Сервисный сбор", price: "2 136Р")
            priceView(name: "К оплате", price: "198 036Р")
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
