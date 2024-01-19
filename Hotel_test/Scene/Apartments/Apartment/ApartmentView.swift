//
//  ApartmentView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI

struct ApartmentView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: ApartmentViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            images
            name
            tags
            aboutApartment
            price
            button
        }
    }
    
    private var images: some View {
        PageViews(contentName: viewModel.imageUrls)
    }
    
    private var name: some View {
        Text(viewModel.name)
            .font(.Medium.size22)
            .foregroundColor(.hBlack)
    }
    
    private var tags: some View {
        TagsView(viewModel.peculiarities)
    }
    
    private var aboutApartment: some View {
        HStack(spacing: Constants.AboutApartment.spacingH) {
            Text(L.Apartment.aboutApartment)
                .font(.Medium.size16)
            A.Icons.aboutCell.swiftUIImage
        }
        .padding(.horizontal, Constants.AboutApartment.paddingH)
        .padding(.vertical, Constants.AboutApartment.paddingV)
        .foregroundColor(.hBlue)
        .background(Color.hBlueAlpha)
        .cornerRadius(Constants.AboutApartment.cornerRadius)
    }
    
    private var price: some View {
        HStack(alignment: .bottom, spacing: Constants.Price.spacingH) {
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
            coordinator.push(.booking)
        }
    }
    
    // MARK: - Constants
    private enum Constants {
        static let spacing: CGFloat = 8
        enum AboutApartment{
            static let spacingH: CGFloat = 2
            static let paddingH: CGFloat = 10
            static let paddingV: CGFloat = 5
            static let cornerRadius: CGFloat = 5
        }
        enum Price{
            static let spacingH: CGFloat = 8
        }
    }
    
}

#Preview {
    ApartmentView(viewModel:ApartmentViewModel())
}
