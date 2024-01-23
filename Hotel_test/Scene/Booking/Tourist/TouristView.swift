//
//  TouristView.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 18.12.2023.
//

import SwiftUI

struct TouristView: View {
    
    var number: Int
    var numberString: String {
        return numberTouristString(number)
    }
    
    @ObservedObject var model: TouristModel
    @State private var rotation: Double = 0

    init(number: Int, model: TouristModel = TouristModel()) {
        self.number = number
        self.model = model
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(numberString)
                    .font(.Medium.size22)
                    .foregroundColor(.hBlack)
                Spacer()
                ZStack {
                    Rectangle()
                        .colorMultiply(.hBlueAlpha)
                        .frame(width: Constants.Rectangle.width, height: Constants.Rectangle.height)
                        .cornerRadius(Constants.Rectangle.cornerRadius)
                    Image(model.buttonImage)
                        .frame(width: Constants.Image.width, height: Constants.Image.height)
                        .rotationEffect(.degrees(rotation))
                        .onTapGesture {
                            changeVisible()
                        }
                }
                .foregroundColor(Color.hBlue)
                
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
    
    // MARK: - Methods
    private func changeVisible() {

        withAnimation(.linear(duration: 0.5)) {
            model.toogle()
            if rotation == 0 {
                rotation += Constants.rotation
            } else {
                rotation -= Constants.rotation
            }
        }
    }
    
    private func numberTouristString( _ number: Int) -> String {
        switch number {
        case 0:
            return L.Booking.Tourist.first
        case 1:
            return L.Booking.Tourist.second
        case 2:
            return L.Booking.Tourist.third
        case 3:
            return L.Booking.Tourist.four
        case 4:
            return L.Booking.Tourist.five
        case 5:
            return L.Booking.Tourist.six
        default:
            return String(number + 1) + L.Booking.Tourist.default
        }
    }

    // MARK: - Hashable
    static func == (lhs: TouristView, rhs: TouristView) -> Bool {
        lhs.number == rhs.number
    }
    
    // MARK: - Constants
    private enum Constants {
        static let rotation: Double = 180
        enum Rectangle {
            static let width: CGFloat = 32
            static let height: CGFloat = 32
            static let cornerRadius: CGFloat = 6
        }
        enum Image {
            static let width: CGFloat = 12
            static let height: CGFloat = 6
        }
    }
    
}

#Preview {
    TouristView(number: 0)
}

extension DateFormatter {
    static func date(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: string)
    }
}
