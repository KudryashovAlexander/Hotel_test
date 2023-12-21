//
//  TouristModel.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 20.12.2023.
//

import Foundation

protocol TouristViewModelProtocol: ObservableObject {
    var name: String { get }
    var surName: String { get }
    var dayBirthday: Date? { get }
    var nationality: String { get }
    var passport: Int? { get }
    var passportEndDay: Date? { get }
    var isExpanded: Bool { get }
    var buttonImage: String { get }
}

class TouristModel: TouristViewModelProtocol {
    var name: String
    var surName: String
    var dayBirthday: Date?
    var nationality: String
    var passport: Int?
    var passportEndDay: Date?
    @Published var isExpanded: Bool
    var buttonImage: String
    
    init(name: String = "",
         surName: String = "",
         dayBirthday: Date? = nil,
         nationality: String = "",
         passport: Int? = nil,
         passportEndDay: Date? = nil,
         isExpanded: Bool = false)
    {
        self.name = name
        self.surName = surName
        self.dayBirthday = dayBirthday
        self.nationality = nationality
        self.passport = passport
        self.passportEndDay = passportEndDay
        self.isExpanded = isExpanded
        if isExpanded {
            self.buttonImage = "touristReverse"
        } else {
            self.buttonImage = "touristReverse"
        }
    }
    
    func toogle() {
        isExpanded.toggle()
        objectWillChange.send()
    }
    
}
