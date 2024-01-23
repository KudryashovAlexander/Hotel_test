//
//  NavigationTitle.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import SwiftUI

struct NavigationTitle: View {
    
    var title: String
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .navigationTitle(title)
            .foregroundColor(.hBlack)
            .font(.Medium.size18)
    }
    
}

#Preview {
    NavigationTitle("Title")
}
