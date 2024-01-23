//
//  NavigationTitleModify.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.01.2024.
//

import SwiftUI

struct NavigationTitleModify: ViewModifier {
    
    @EnvironmentObject private var coordinator: Coordinator
    var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(.backNavButton)
                        .onTapGesture {
                            coordinator.pop()
                        }
                }
            }
    }
}

extension View {
    func modifyNavigation(title: String) -> some View {
        self.modifier(NavigationTitleModify(title: title))
    }
}
