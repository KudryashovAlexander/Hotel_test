//
//  ApartmentsView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI

struct ApartmentsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: ApartmentsViewModel
    var body: some View {
        VStack {
            ScrollView {
                apartments
            }
            .background(Color.hLightGrayPhone)
        }
        .navigationTitle(viewModel.titleName)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Image(.backNavButton)
                    .onTapGesture {
                        coordinator.pop()
                    }
            }
        }
    }
    
    var apartments: some View {
        VStack(spacing:8) {
            ForEach(viewModel.apartmentArray, id: \.self) { apartment in
                ApartmentView(viewModel: apartment)
            }
            .modify()
        }
    }
    
    private enum Constants {
       // TODO: -
    }
}

#Preview {
    ApartmentsView(viewModel: ApartmentsViewModel())
}
