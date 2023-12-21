//
//  Foundation_ext..swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 19.12.2023.
//

import Foundation

extension Int {
    func priceString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        let numberString = numberFormatter.string(for: self) ?? String(self)
        return numberString + " ₽"
    }
}
