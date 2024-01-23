//
//  RatingView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct RatingView: View {
    let score: String
    
    init(rating: Int, score: String) {
        self.score = String(rating) + " " + score
    }
    
    var body: some View {
        HStack(spacing:Constants.spacing) {
            Image("star")
            Text(score)
        }
        .padding(.vertical, Constants.paddingV)
        .padding(.horizontal, Constants.paddingH)
        .foregroundColor(.hOrange)
        .background(Color.hOrangeAlpha)
        .cornerRadius(Constants.cornerRadius)
    }
    
    private enum Constants {
        static let paddingV: CGFloat = 5
        static let paddingH: CGFloat = 10
        static let cornerRadius: CGFloat = 5
        static let spacing: CGFloat = 2
    }
    
}

#Preview {
    RatingView(rating: 5, score: "Превосходно")
}
