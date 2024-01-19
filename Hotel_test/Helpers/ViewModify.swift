//
//  ViewModify.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import Foundation

import SwiftUI

struct ViewModify: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(Constants.padding)
            .background(Color.white)
            .cornerRadius(Constants.cornerRadius)
    }
    
    private enum Constants {
        static let padding: CGFloat = 16
        static let cornerRadius: CGFloat = 15
    }
}

extension View {
    func modify() -> some View {
        self.modifier(ViewModify())
    }
}
