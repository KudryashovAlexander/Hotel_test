//
//  NetworkClient.swift
//  Hotel_test
//
//  Created by Александр Кудряшов on 21.12.2023.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct NetworkClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func fetch<T:Decodable>(endPoint: Endpoint,
                            httpMethod: HttpMethod = .get,
                            handler: @escaping(Result<T,Error>) -> Void) {
        
        var request = URLRequest(url: endPoint.url!)
        request.httpMethod = httpMethod.rawValue
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                handler(.failure(NetworkClientError.urlSessionError))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode >= 300 {
                handler(.failure(NetworkClientError.httpStatusCode(response.statusCode)))
            }
            
            guard let data = data else { return }
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                handler(.success(decodedData))
            } catch {
                handler(.failure(error))
            }
        }
        task.resume()
    }
    
}
