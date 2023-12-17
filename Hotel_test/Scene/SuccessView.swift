//
//  SuccessView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 17.12.2023.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundColor(.hLightGrayPhone)
                Image("sucessOrder")
                
            }
            Text("Ваш заказ принят в работу")
                .font(.Medium.size22)
                .multilineTextAlignment(.center)
                .foregroundColor(.hBlack)
                .padding(.top, 32)
                .padding(.bottom, 20)
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(.Regular.size16)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
           
            
        }
        .padding(.leading, 23)
        .padding(.trailing, 23)
        
    }
    
    private enum Constants {
        
    }
}

#Preview {
    SuccessView()
}
