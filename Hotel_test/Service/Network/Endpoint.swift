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
        URL(string:"https://run.mocky.io/v3/")!
    }
    
    var path: String {
        switch self {
        case .hotel:     return "75000507-da9a-43f8-a618-df698ea7176d"
        case .apartment: return "157ea342-a8a3-4e00-a8e6-a87d170aa0a2"
        case .booking:   return "63866c74-d593-432c-af8e-f279d1a8d2ff"
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
