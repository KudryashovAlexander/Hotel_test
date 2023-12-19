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
            .padding(16)
            .background(Color.white)
            .cornerRadius(15)
    }
}

extension View {
    func modify() -> some View {
        self.modifier(ViewModify())
    }
}
