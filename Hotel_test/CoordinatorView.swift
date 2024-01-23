//
//  CoordinatorView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.01.2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .hotel)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
