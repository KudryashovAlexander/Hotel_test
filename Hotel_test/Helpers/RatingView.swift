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
        HStack(spacing:2) {
            Image("star")
            Text(score)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .foregroundColor(.hOrange)
        .background(Color.hOrangeAlpha)
        .cornerRadius(5)
    }
    
}

#Preview {
    RatingView(rating: 5, score: "Превосходно")
}
