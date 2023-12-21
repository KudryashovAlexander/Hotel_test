//
//  ButtonView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    let action: () -> Void
    
    init(text: String, action: @escaping () -> Void ) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        VStack {
            Button(text) {
                action()
            }
            .frame(maxWidth: .infinity)
            .frame(height:Constants.height)
            .foregroundColor(.white)
            .background(Color.hBlue)
            .cornerRadius(Constants.cornerRadius)
        }
        .padding(.horizontal, Constants.padding)
    }
    
    private enum Constants {
        static let height: CGFloat = 48
        static let cornerRadius: CGFloat = 15
        static let padding: CGFloat = 16
    }
}

#Preview {
    ButtonView(text: "Текст") { }
}
