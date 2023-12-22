//
//  Endpoint.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.12.2023.
//

import Foundation

enum Endpoint {
    case hotel
    case apartment
    case booking
    
    static var baseURL: URL {
        URL(string:"https://run.mocky.io/v3")!
    }
    
    var path: String {
        switch self {
        case .hotel:     return "/d144777c-a67f-4e35-867a-cacc3b827473"
        case .apartment: return "/v3/8b532701-709e-4194-a41c-1a903af00195"
        case .booking:   return "/63866c74-d593-432c-af8e-f279d1a8d2ff"
        }
    }
    
    var url: URL? {
        switch self {
        case .hotel:      return URL(string: Endpoint.hotel.path, relativeTo: Endpoint.baseURL)
        case .apartment:  return URL(string: Endpoint.apartment.path, relativeTo: Endpoint.baseURL)
        case .booking:    return URL(string: Endpoint.booking.path, relativeTo: Endpoint.baseURL)
        }
    }
}
