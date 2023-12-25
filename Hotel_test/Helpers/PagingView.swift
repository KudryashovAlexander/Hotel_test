//
//  PagingView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI
/*
struct PagingView<Content: View>: View {
    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content
    
    @State private var offset = CGFloat.zero
    @State private var dragging = false
    
    init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
        self._index = Binding<0>
        self.maxIndex = maxIndex
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false ) {
                    HStack(spacing:0) {
                        self.content()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                }
                .content.offset(x: self.offset(in: geometry), y:0)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture().onChanged { value in
                        self.dragging = true
                        self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                    }
                    .onEnded { value in
                        let predictedEndOffset = -CGFloat(self.index) * geometry.size.width
                        + value.predictedEndTranslation.width
                        let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                        self.index = self.clampedIndex(from: predictedIndex)
                        withAnimation(.easeOut) {
                            self.dragging = false
                        }
                    }
                )
            }
            .clipped()
            PageControl(index: $index, maxIndex: maxIndex)
        }
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(self.index) * geometry.size.width
        }
    }

    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
}

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing:Constants.spacing) {
            ForEach(0...maxIndex, id: \.self) { index in
               Circle()
                    .fill(circleColor(index: index))
                    .frame(width: Constants.radius, height: Constants.radius)
            }
        }
        .background(Color.white)
        .padding(.horizontal, Constants.paddingH)
        .padding(.vertical, Constants.paddingV)
    }
    
    private func circleColor(index: Int) -> Color {
        let difference = abs(index - self.index)
        if difference < 4 {
            return Color.black.opacity(Constants.opacity[difference])
        } else {
            return Color.black.opacity(Constants.opacity.last!)
        }
    }
    
    private enum Constants {
        static let spacing: CGFloat = 5
        static let radius: CGFloat = 7
        static let paddingH: CGFloat = 10
        static let paddingV: CGFloat = 5
        static let opacity: [Double] = [1, 0.22, 0.17, 0.10, 0.05]
    }
}

#Preview {
    PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                    ForEach(self.images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
}

*/