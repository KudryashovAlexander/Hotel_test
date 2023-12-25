//
//  TextFieldModify.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import SwiftUI

struct TextFieldModify: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.Regular.size16)
            .padding(.horizontal, Constants.paddingH)
            .frame(height: Constants.height)
            .background(Color.hLightGrayPhone)
            .cornerRadius(Constants.cornerRadius)
    }
    
    private enum Constants {
        static let paddingH: CGFloat = 16
        static let height: CGFloat = 52
        static let cornerRadius: CGFloat = 10
    }
    
}

extension TextField {
    func modifyTF() -> some View {
        self.modifier(TextFieldModify())
    }
}
