//
//  TouristView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct TouristView: View {
    
    var numberTourist: String
    var isExpanded: Bool = false
    @State private var name: String = ""
    @State private var surName: String = ""
    @State private var dayBirthday: Date?
    @State private var nationality: String = ""
    @State private var passport: Int?
    @State private var passportEndDay: Date?
    
    init(numberTourist: String) {
        self.numberTourist = numberTourist
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(numberTourist)
                    .font(.Medium.size22)
                    .foregroundColor(.hBlack)
                Spacer()
                Image("touristReverse")
                    .frame(width: 32, height: 32)
                    .onTapGesture {
                        // isExpanded.toggle()
                    }
            }
            nameTextField
            surNameTextField
            dayBirthdayTextField
            nationalityTextField
            passportTextField
            passportEndDayTextField
        }
        .modify()
    }
    
    private func textFieldView(placeholder: String, binding: Binding<String>) -> some View {
        TextField(placeholder, text: binding)
            .modifyTF()
    }
    
    private var nameTextField: some View {
        TextField(L.Booking.Tourist.name, text: $name)
            .modifyTF()
    }
    
    private var surNameTextField: some View {
        TextField(L.Booking.Tourist.surName, text: $surName)
            .modifyTF()
    }
    
    private var dayBirthdayTextField: some View {
        TextField(L.Booking.Tourist.birthday, text: Binding(
                   get: {
                       let dateFormatter = DateFormatter()
                       dateFormatter.dateFormat = "dd.MM.yyyy"
                       if let dayBirthday = dayBirthday {
                           return dateFormatter.string(from: dayBirthday)
                       } else {
                           return ""
                       }
                   },
                   set: {
                       if let date = DateFormatter.date(from: $0) {
                           dayBirthday = date
                       }
                   }
               ))
        .modifyTF()
    }
    
    private var nationalityTextField: some View {
        TextField(L.Booking.Tourist.nationality, text: $nationality)
            .modifyTF()
    }
    
    private var passportTextField: some View {
        TextField(L.Booking.Tourist.passport, value:$passport, formatter: NumberFormatter())
            .modifyTF()
    }
    
    private var passportEndDayTextField: some View {
        TextField(L.Booking.Tourist.passportEndDay, text: Binding(
                   get: {
                       let dateFormatter = DateFormatter()
                       dateFormatter.dateFormat = "dd.MM.yyyy"
                       if let passportEndDay = passportEndDay {
                           return dateFormatter.string(from: passportEndDay)
                       } else {
                           return ""
                       }
                   },
                   set: {
                       if let date = DateFormatter.date(from: $0) {
                           passportEndDay = date
                       }
                   }
               ))
        .modifyTF()
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
