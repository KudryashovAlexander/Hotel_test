//
//  HotelView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import SwiftUI

struct HotelView: View {
    var viewModel: HotelViewModel
    
    var body: some View {
        VStack {
            NavigationTitle(L.Hotel.title)
            ScrollView {
                hotel
                aboutHotel
            }
            .frame(width:.infinity)
            .background(Color.hLightGrayPhone)
            button
        }
    }
    
    private var hotel: some View {
        VStack(alignment:.leading, spacing: 8) {
            imageScroll
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
            HStack(alignment:.bottom) {
                Text(viewModel.hotelMinimalPrice)
                    .font(.SemiBold.size30)
                    .foregroundColor(.hBlack)
                Text(viewModel.priceForIt)
                    .font(.Regular.size16)
                    .foregroundColor(.hGray)
            }
        }
        .modify()
    }
    
    private var aboutHotel: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            Text(L.Hotel.about)
                .font(.Medium.size22)
                .foregroundColor(.hBlack)
            tag
            Text(viewModel.description)
                .font(.Regular.size16)
           
            VStack {
                aboutCell(image: A.Icons.сonveniences.swiftUIImage,
                          name: L.Hotel.conveniences)
                Divider()
                    .padding(.leading, 34)
                    .padding(.vertical, 2)
                aboutCell(image: A.Icons.included.swiftUIImage,
                          name: L.Hotel.included)
                Divider()
                    .padding(.leading, 34)
                    .padding(.vertical, 2)
                aboutCell(image: A.Icons.noIncluded.swiftUIImage,
                          name: L.Hotel.noIncluded)
            }
            .padding(15)
            .background(Color.hLightGrayPhone)
            .cornerRadius(15)
            
        }
        .modify()
    }
    
    private var tag: some View {
        TagsView(viewModel.peculiarities)
    }
    
    private var button: some View {
        VStack {
            Divider()
            ButtonView(text: L.Hotel.button) {
                // TODO: -
                print("press button")
            }
            .padding(.horizontal, 16)
        }
        .background(Color.white)
    }
    
    private var imageScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:8) {
                ForEach(viewModel.mockImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height:257)
                        .clipped()
                        .cornerRadius(15)
                }
            }
        }
    }
    
    private var aboutdetail: some View {
        VStack {
            
        }
    }
    
    private func aboutCell(image: Image, name: String, choose: String = L.Hotel.necessary) -> some View {
        HStack(spacing: 12) {
            image
            VStack(alignment:.leading, spacing: 2) {
                Text(name)
                    .font(.Medium.size16)
                    .foregroundColor(.hBlack)
                Text(choose)
                    .font(.Medium.size14)
                    .foregroundColor(.hGray)
            }
            Spacer()
            A.Icons.aboutCell.swiftUIImage
                .frame(width: 24, height: 24)
        }
    }
    
    private enum Constants {
       // TODO: - 
    }
    
}

#Preview {
    HotelView(viewModel: HotelViewModel())
}
