// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L {
  /// Plural format key: "%#@days@"
  public static func numberOfdays(_ p1: Int) -> String {
    return L.tr("Localizable", "numberOfdays", p1, fallback: "Plural format key: \"%#@days@\"")
  }
  public enum Apartment {
    /// Подробнее о номере
    public static let aboutApartment = L.tr("Localizable", "apartment.aboutApartment", fallback: "Подробнее о номере")
    /// Выбрать номер
    public static let button = L.tr("Localizable", "apartment.button", fallback: "Выбрать номер")
  }
  public enum Booking {
    /// Оплатить
    public static let button = L.tr("Localizable", "booking.button", fallback: "Оплатить")
    /// Бронирование
    public static let title = L.tr("Localizable", "booking.title", fallback: "Бронирование")
    public enum Byer {
      /// Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту
      public static let comment = L.tr("Localizable", "booking.byer.comment", fallback: "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
      /// Информация о покупателе
      public static let information = L.tr("Localizable", "booking.byer.information", fallback: "Информация о покупателе")
      /// Почта
      public static let mail = L.tr("Localizable", "booking.byer.mail", fallback: "Почта")
      /// Номер телефона
      public static let phone = L.tr("Localizable", "booking.byer.phone", fallback: "Номер телефона")
    }
    public enum Detail {
      /// Номер
      public static let apartment = L.tr("Localizable", "booking.detail.apartment", fallback: "Номер")
      /// Страна, город
      public static let countryCity = L.tr("Localizable", "booking.detail.countryCity", fallback: "Страна, город")
      /// Даты
      public static let date = L.tr("Localizable", "booking.detail.date", fallback: "Даты")
      /// Вылет из
      public static let departure = L.tr("Localizable", "booking.detail.departure", fallback: "Вылет из")
      /// Питание
      public static let eating = L.tr("Localizable", "booking.detail.eating", fallback: "Питание")
      /// Отель
      public static let hotel = L.tr("Localizable", "booking.detail.hotel", fallback: "Отель")
      /// Кол-во дней
      public static let numberDays = L.tr("Localizable", "booking.detail.numberDays", fallback: "Кол-во дней")
    }
    public enum Pay {
      /// Топливный сбор
      public static let fuelСollection = L.tr("Localizable", "booking.pay.fuelСollection", fallback: "Топливный сбор")
      /// К оплате
      public static let paid = L.tr("Localizable", "booking.pay.paid", fallback: "К оплате")
      /// Сервисный сбор
      public static let serviceFee = L.tr("Localizable", "booking.pay.serviceFee", fallback: "Сервисный сбор")
      /// Тур
      public static let tour = L.tr("Localizable", "booking.pay.tour", fallback: "Тур")
    }
    public enum Tourist {
      /// Добавить туриста
      public static let add = L.tr("Localizable", "booking.tourist.add", fallback: "Добавить туриста")
      /// Дата рождения
      public static let birthday = L.tr("Localizable", "booking.tourist.birthday", fallback: "Дата рождения")
      /// Первый турист
      public static let first = L.tr("Localizable", "booking.tourist.first", fallback: "Первый турист")
      /// Имя
      public static let name = L.tr("Localizable", "booking.tourist.name", fallback: "Имя")
      /// Гражданство
      public static let nationality = L.tr("Localizable", "booking.tourist.nationality", fallback: "Гражданство")
      /// Номер загранпаспорта
      public static let passport = L.tr("Localizable", "booking.tourist.passport", fallback: "Номер загранпаспорта")
      /// Срок действия загранпаспорта
      public static let passportEndDay = L.tr("Localizable", "booking.tourist.passportEndDay", fallback: "Срок действия загранпаспорта")
      /// Второй турист
      public static let second = L.tr("Localizable", "booking.tourist.second", fallback: "Второй турист")
      /// Фамилия
      public static let surName = L.tr("Localizable", "booking.tourist.surName", fallback: "Фамилия")
    }
  }
  public enum Hotel {
    /// Об отеле
    public static let about = L.tr("Localizable", "hotel.about", fallback: "Об отеле")
    /// К выбору номера
    public static let button = L.tr("Localizable", "hotel.button", fallback: "К выбору номера")
    /// Удобства
    public static let conveniences = L.tr("Localizable", "hotel.conveniences", fallback: "Удобства")
    /// Что включено
    public static let included = L.tr("Localizable", "hotel.included", fallback: "Что включено")
    /// Самое необходимое
    public static let necessary = L.tr("Localizable", "hotel.necessary", fallback: "Самое необходимое")
    /// Что не включено
    public static let noIncluded = L.tr("Localizable", "hotel.noIncluded", fallback: "Что не включено")
    /// Отель
    public static let title = L.tr("Localizable", "hotel.title", fallback: "Отель")
  }
  public enum Order {
    /// Супер!
    public static let button = L.tr("Localizable", "order.button", fallback: "Супер!")
    /// Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.
    public static let comment = L.tr("Localizable", "order.comment", fallback: "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
    /// Ваш заказ принят в работу
    public static let result = L.tr("Localizable", "order.result", fallback: "Ваш заказ принят в работу")
    /// Заказ оплачен
    public static let title = L.tr("Localizable", "order.title", fallback: "Заказ оплачен")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
