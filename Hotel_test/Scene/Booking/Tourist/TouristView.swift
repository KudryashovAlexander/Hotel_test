//
//  TouristView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct TouristView: View {
    
    var numberTourist: String
    @ObservedObject var model: TouristModel

    init(numberTourist: String, model: TouristModel = TouristModel()) {
        self.numberTourist = numberTourist
        self.model = model
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(numberTourist)
                    .font(.Medium.size22)
                    .foregroundColor(.hBlack)
                Spacer()
                Image(model.buttonImage)
                    .frame(width: 32, height: 32)
                    .onTapGesture {
                        changeVisible()
                    }
            }
            if model.isExpanded {
                VStack {
                    nameTextField
                    surNameTextField
                    dayBirthdayTextField
                    nationalityTextField
                    passportTextField
                    passportEndDayTextField
                }
            }

        }
        .modify()
    }
    
    private func textFieldView(placeholder: String, binding: Binding<String>) -> some View {
        TextField(placeholder, text: binding)
            .modifyTF()
    }
    
    private var nameTextField: some View {
        TextField(L.Booking.Tourist.name, text: $model.name)
            .modifyTF()
    }
    
    private var surNameTextField: some View {
        TextField(L.Booking.Tourist.surName, text: $model.surName)
            .modifyTF()
    }
    
    private var dayBirthdayTextField: some View {
        TextField(L.Booking.Tourist.birthday, text: Binding(
                   get: {
                       let dateFormatter = DateFormatter()
                       dateFormatter.dateFormat = "dd.MM.yyyy"
                       if let dayBirthday = model.dayBirthday {
                           return dateFormatter.string(from: dayBirthday)
                       } else {
                           return ""
                       }
                   },
                   set: {
                       if let date = DateFormatter.date(from: $0) {
                           model.dayBirthday = date
                       }
                   }
               ))
        .modifyTF()
    }
    
    private var nationalityTextField: some View {
        TextField(L.Booking.Tourist.nationality, text: $model.nationality)
            .modifyTF()
    }
    
    private var passportTextField: some View {
        TextField(L.Booking.Tourist.passport, value:$model.passport, formatter: NumberFormatter())
            .modifyTF()
    }
    
    private var passportEndDayTextField: some View {
        TextField(L.Booking.Tourist.passportEndDay, text: Binding(
                   get: {
                       let dateFormatter = DateFormatter()
                       dateFormatter.dateFormat = "dd.MM.yyyy"
                       if let passportEndDay = model.passportEndDay {
                           return dateFormatter.string(from: passportEndDay)
                       } else {
                           return ""
                       }
                   },
                   set: {
                       if let date = DateFormatter.date(from: $0) {
                           model.passportEndDay = date
                       }
                   }
               ))
        .modifyTF()
    }
    
    private func changeVisible() {
        model.toogle()
    }
    
    private enum Constants {
       // TODO: -
    }
}

#Preview {
    TouristView(numberTourist: L.Booking.Tourist.first)
}

extension DateFormatter {
    static func date(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: string)
    }
}
