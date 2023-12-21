//
//  ApartmentView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI

struct ApartmentView: View {
    @ObservedObject var viewModel: ApartmentViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            images
            name
            tags
            aboutApartment
            price
            button
        }
    }
    
    private var images: some View {
        // TODO: -
        HStack { }
    }
    
    private var name: some View {
        Text(viewModel.name)
            .font(.Medium.size22)
            .foregroundColor(.hBlack)
    }
    
    private var tags: some View {
        // TODO: -
        HStack { }
    }
    
    private var aboutApartment: some View {
        HStack(spacing: 2) {
            Text(L.Apartment.aboutApartment)
                .font(.Medium.size16)
            A.Icons.aboutCell.swiftUIImage
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(.hBlue)
        .background(Color.hBlueAlpha)
        .cornerRadius(5)
    }
    
    private var price: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text(viewModel.price.priceString())
                .font(.SemiBold.size30)
                .foregroundColor(.hBlack)
            Text(viewModel.pricePer)
                .font(.Regular.size16)
                .foregroundColor(.hGray)
        }
    }
    
    private var button: some View {
        ButtonView(text: L.Apartment.button) {
            viewModel.checkNumber()
        }
    }
    
}

#Preview {
    ApartmentView(viewModel:ApartmentViewModel())
}
