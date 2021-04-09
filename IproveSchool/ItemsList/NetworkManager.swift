//
//  NetworkManager.swift
//  School
//
//  Created by Михаил Галушкин on 08.04.2021.
//

import Alamofire
import Foundation

enum Result<T: Codable> {
    case success(T)
    case failure(Error)
}

class NetworkManager<T: URLRequestBuilder> {
    func load<U: Codable>(service: T, decodeType _: U.Type, completion: @escaping (Result<U>) -> Void) {
        guard let urlRequest = service.urlRequest else { return }

        AF.request(urlRequest).responseDecodable(of: U.self) { responce in
            switch responce.result {
            case let .success(result):
                completion(.success(result))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
