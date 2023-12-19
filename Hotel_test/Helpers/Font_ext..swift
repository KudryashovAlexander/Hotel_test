//
//  Font_ext..swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 17.12.2023.
//

import SwiftUI

extension Font {
    enum Regular {
        static var size14: Font { Font.system(size: 14, weight: .regular) }
        static var size16: Font { Font.system(size: 16, weight: .regular) }
    }
    enum Medium {
        static var size14: Font { Font.system(size: 14, weight: .medium) }
        static var size16: Font { Font.system(size: 16, weight: .medium) }
        static var size18: Font { Font.system(size: 18, weight: .medium) }
        static var size22: Font { Font.system(size: 22, weight: .medium) }
    }
    enum SemiBold {
        static var size30: Font { Font.system(size: 30, weight: .semibold) }
    }
}
