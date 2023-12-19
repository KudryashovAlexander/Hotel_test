//
//  ResultOrderView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 17.12.2023.
//

import SwiftUI

struct ResultOrderView: View {
    @StateObject var viewModel: ResultOrderViewModel
    var body: some View {
        VStack {
            VStack {
                Spacer()
                image
                texts
                Spacer()
            }
            .padding(.horizontal, Constants.padding)
            Divider()
            button
        }
    }
    
    private var image: some View {
        ZStack {
            Circle()
                .frame(width: Constants.Circle.radius, height: Constants.Circle.radius)
                .foregroundColor(.hLightGrayPhone)
            Image(viewModel.imageName)
        }
    }
    
    private var texts: some View {
        VStack {
            Text(viewModel.orderResult)
                .font(.Medium.size22)
                .multilineTextAlignment(.center)
                .foregroundColor(.hBlack)
                .padding(.top, Constants.OrderResult.topPadding)
                .padding(.bottom, Constants.OrderResult.bottomPadding)
            Text(viewModel.orderComment)
                .font(.Regular.size16)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
    }
    
    private var button: some View {
        ButtonView(text: viewModel.buttonName) {
            print("Press button")
        }
    }
    
    private enum Constants {
        static let padding: CGFloat = 23
        enum Circle {
            static let radius: CGFloat = 94
        }
        enum OrderResult {
            static let topPadding: CGFloat = 32
            static let bottomPadding: CGFloat = 20
        }
    }
}

#Preview {
    ResultOrderView(viewModel: ResultOrderViewModel())
}