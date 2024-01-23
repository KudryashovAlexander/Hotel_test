//
//  PageViews.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 25.12.2023.
//

import SwiftUI
import Kingfisher

struct PageViews: View {
    
    var contentName: [String]
    let isURL: Bool
    
    init(contentName: [String], isURL: Bool = false ) {
        self.contentName = contentName
        self.isURL = isURL
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(contentName, id: \.self) { imageName in
                    VStack {
                        if isURL == false {
                            Image(imageName)
                                .resizable()
                        } else {
                            let url = URL(string:imageName)!
                            // TODO: -  доработать
//                            let placeholderImage = A.Images.noImage.name
                            KFImage.url(url)
                                .resizable()
                        }
                    }
                    .scaledToFill()
                    .frame(height:257)
                    .clipped()
                    .cornerRadius(15)
                }
            }
        }
    }
}

#Preview {
    PageViews(contentName: ["mockhotel1","mockhotel2","mockhotel3"])
}
