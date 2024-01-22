//
//  HotelView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import SwiftUI

struct HotelView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var viewModel: HotelViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                hotel
                aboutHotel
            }
            .background(.hLightGrayPhone)
            button
        }
        .navigationTitle(L.Hotel.title)        
    }
    
    private var hotel: some View {
        VStack(alignment:.leading, spacing: Constants.Hotel.spacing) {
            imageScroll
            HStack {
                RatingView(rating: viewModel.model.rating, score: viewModel.model.ratingName)
                Spacer()
            }
            Text(viewModel.model.name)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
            Text(viewModel.model.adress)
                .font(.Medium.size14)
                .multilineTextAlignment(.leading)
                .foregroundColor(.hBlue)
            HStack(alignment:.bottom) {
                Text(viewModel.model.minimalPrice)
                    .font(.SemiBold.size30)
                    .foregroundColor(.hBlack)
                Text(viewModel.model.priceForIt)
                    .font(.Regular.size16)
                    .foregroundColor(.hGray)
            }
        }
        .modify()
    }
    
    private var aboutHotel: some View {
        LazyVStack(alignment: .leading, spacing: Constants.AbouHotel.spacing) {
            Text(L.Hotel.about)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
            tag
            Text(viewModel.model.description)
                .font(.Regular.size16)
           
            VStack {
                aboutCell(image: A.Icons.сonveniences.swiftUIImage,
                          name: L.Hotel.conveniences)
                divider
                aboutCell(image: A.Icons.included.swiftUIImage,
                          name: L.Hotel.included)
                divider
                aboutCell(image: A.Icons.noIncluded.swiftUIImage,
                          name: L.Hotel.noIncluded)
            }
            .padding(Constants.AbouHotel.padding)
            .background(Color.hLightGrayPhone)
            .cornerRadius(Constants.AbouHotel.cornerRadius)
        }
        .modify()
    }
    
    private var divider: some View {
        Divider()
            .padding(.leading, Constants.AbouHotel.Divider.paddingL)
            .padding(.vertical, Constants.AbouHotel.Divider.paddingV)
    }
    
    private var tag: some View {
        TagsView(viewModel.model.peculiarities)
    }
    
    private var button: some View {
        VStack {
            Divider()
            ButtonView(text: L.Hotel.button) {
                viewModel.pressButton {
                    coordinator.push(.apartment)
                }
            }
            .padding(.horizontal, Constants.Button.paddingH)
        }
        .background(Color.white)
    }
    
    private var imageScroll: some View {
        PageViews(contentName: viewModel.model.imageUrls)
    }
    
    private var aboutdetail: some View {
        VStack {
            //TODO: -
        }
    }
    
    // MARK: - Methods
    private func aboutCell(image: Image, name: String, choose: String = L.Hotel.necessary) -> some View {
        HStack(spacing: Constants.AbouHotel.Cell.spacingH) {
            image
            VStack(alignment:.leading, spacing: Constants.AbouHotel.Cell.spacingV) {
                Text(name)
                    .font(.Medium.size16)
                    .foregroundColor(.hBlack)
                Text(choose)
                    .font(.Medium.size14)
                    .foregroundColor(.hGray)
            }
            Spacer()
            A.Icons.aboutCell.swiftUIImage
                .frame(width: Constants.AbouHotel.Cell.imageWH,
                       height: Constants.AbouHotel.Cell.imageWH)
        }
    }
    
    // MARK: - Constants
    private enum Constants {
        enum Hotel {
            static let spacing: CGFloat = 8
        }
        enum AbouHotel {
            static let spacing: CGFloat = 16
            static let padding: CGFloat = 15
            static let cornerRadius: CGFloat = 15
            enum Divider {
                static let paddingL: CGFloat = 34
                static let paddingV: CGFloat = 2
            }
            enum Cell {
                static let spacingH: CGFloat = 12
                static let spacingV: CGFloat = 2
                static let imageWH: CGFloat = 24
            }
        }
        enum Button {
            static let paddingH: CGFloat = 16
        }
    }
}

//#Preview {
//    HotelView(viewModel: HotelViewModel())
//}
