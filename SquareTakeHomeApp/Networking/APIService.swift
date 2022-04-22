//
//  APIService.swift
//  SquareTakeHomeApp
//
//  Created by clydies freeman on 4/20/22.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
