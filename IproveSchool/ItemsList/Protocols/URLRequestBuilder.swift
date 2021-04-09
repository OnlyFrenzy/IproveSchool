//
//  URLRequestBuilder.swift
//  School
//
//  Created by Михаил Галушкин on 08.04.2021.
//

import Alamofire
import Foundation

protocol URLRequestBuilder: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
}

extension URLRequestBuilder {
    var baseURL: String {
        "https://rickandmortyapi.com/api"
    }

    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()

        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        switch method {
        case .get:
            request.allHTTPHeaderFields = headers?.dictionary
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            break
        }

        return request
    }
}
