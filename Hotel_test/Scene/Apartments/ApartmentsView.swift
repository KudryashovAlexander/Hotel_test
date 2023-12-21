//
//  ApartmentsView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI

struct ApartmentsView: View {
    @ObservedObject var viewModel: ApartmentsViewModel
    var body: some View {
        VStack {
            NavigationTitle(viewModel.titleName)
            ScrollView{
                apartments
            }
            .background(Color.hLightGrayPhone)
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
}

#Preview {
    ApartmentsView(viewModel: ApartmentsViewModel())
}
