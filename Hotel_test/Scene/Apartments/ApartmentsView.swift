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
            ScrollView {
                apartments
            }
            .background(Color.hLightGrayPhone)
        }
        .modifyNavigation(title: viewModel.titleName)
    }
    
    var apartments: some View {
        VStack(spacing:Constants.spacingV) {
            ForEach(viewModel.apartments, id: \.self) { apartment in
                ApartmentView(viewModel: apartment)
            }
            .modify()
        }
    }
    
    // MARK: - Constants
    private enum Constants {
        static let spacingV: CGFloat = 8
    }
    
}

//#Preview {
//    ApartmentsView(viewModel: ApartmentsViewModel())
//}
