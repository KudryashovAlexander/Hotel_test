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
            .padding(.horizontal, 16)
            .frame(height:52)
            .background(Color.hLightGrayPhone)
            .cornerRadius(10)
    }
}

extension TextField {
    func modifyTF() -> some View {
        self.modifier(TextFieldModify())
    }
}
