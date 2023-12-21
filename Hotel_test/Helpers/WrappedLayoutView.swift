//
//  WrappedLayoutView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import SwiftUI

struct WrappedLayoutView: View {
    
    @State var array: [String]
    
    init(_ array: [String]) {
        self.array = array
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            if !array.isEmpty {
                ForEach(self.array, id: \.self) { item in
                    self.item(for: item)
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if item == self.array.last! {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: { d in
                            let result = height
                            if item == self.array.last! {
                                height = 0
                            }
                            return result
                        })
                }
            }
        }
    }
    
    func item(for text: String) -> some View {
        Text(text)
            .font(.Medium.size16)
            .lineLimit(1)
            .foregroundColor(.hGray)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.hLightGrayPhone)
            .cornerRadius(5)
    }
}

#Preview {
    WrappedLayoutView(["Бесплатный Wifi на всей территории отеля",
                       "1 км до пляжа",
                       "Бесплатный фитнес-клуб",
                       "20 км до аэропорта"])
}
