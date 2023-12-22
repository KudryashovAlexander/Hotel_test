//
//  NetworkClientError.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 22.12.2023.
//

import Foundation

enum NetworkClientError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}

extension NetworkClientError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .httpStatusCode(let code):
            switch code {
            case 429: return L.Network.Error.httpStatusCode429
            case 400..<500:
                return L.Network.Error.httpStatusCode4xx
            case 500..<600:
                return L.Network.Error.httpStatusCode5xx
            default: return L.Network.Error.httpStatusCode
            }
        case .urlRequestError:
            return L.Network.Error.urlRequestError
        case .urlSessionError:
            return L.Network.Error.urlSessionError
        }
    }
}
