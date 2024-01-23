//
//  PagingView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI

struct PagingView: View {
    @State var index: Int
    var array: [String]
    var maxIndex: Int {
        !array.isEmpty ? array.count - 1 : 0
    }
    
    @State private var offset = CGFloat.zero
    @State private var dragging = false
    
    init(_ array:  [String]) {
        self.index = 0
        self.array = array
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false ) {
                    HStack(spacing:8) {
                        ForEach(array, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height:257)
                                .clipped()
                                .cornerRadius(15)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }
                }
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
            // TODO: - Доработать
            // PageControl(index: $index ,maxIndex: maxIndex)
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

struct PagingView_Previews: PreviewProvider {
    
    @State var index = 0
    var images = [A.Images.mockhotel1.name, A.Images.mockhotel2.name, A.Images.mockhotel3.name]
    
    static var previews: some View {
        VStack(spacing: 20) {
            PagingView([A.Images.mockhotel1.name, A.Images.mockhotel2.name, A.Images.mockhotel3.name])
            .aspectRatio(4/3, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 15))

        }
    }

}
