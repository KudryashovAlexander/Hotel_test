//
//  TagsView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import SwiftUI

struct TagsView: View {
    
    var tags: [String]

    @State private var totalHeight
          = CGFloat.zero
    
    init( _ tags: [String]) {
        self.tags = tags
    }

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            if !tags.isEmpty {
                ForEach(self.tags, id: \.self) { tag in
                    self.item(for: tag)
                        .padding([.horizontal, .vertical], Constants.spacing)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if tag == self.tags.last! {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: { _ in
                            let result = height
                            if tag == self.tags.last! {
                                height = 0
                            }
                            return result
                        })
                }
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
    
    func item(for text: String) -> some View {
        Text(text)
            .font(.Medium.size16)
            .lineLimit(Constants.lineLimit)
            .foregroundColor(.hGray)
            .padding(.horizontal, Constants.paddingH)
            .padding(.vertical, Constants.paddingV)
            .background(Color.hLightGrayPhone)
            .cornerRadius(Constants.cornerRadius)
    }
    
    private enum Constants {
        static let spacing: CGFloat = 4
        static let lineLimit: Int = 1
        static let paddingH: CGFloat = 10
        static let paddingV: CGFloat = 5
        static let cornerRadius: CGFloat = 5
    }
    
}

#Preview {
    TagsView(["Все включено", "Кондиционер", "Все включено", "Кондиционер", "Все включено", "Кондиционер"])
}
