//
//  NetworkService.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 08.04.2021.
//

import Alamofire
import Foundation

class NetworkService {
    func requestLoad(link: Router, completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: link.rawValue) else { return }
        let request = Session.default.request(url, method: .get)
        request.response { response in
            switch response.result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(data):
                guard let data = data else { return }
                let decoder = JSONDecoder()
                guard let result = try? decoder.decode(CharacterResponse.self, from: data) else { return }
                completion(result.results)
            }
        }
        .validate()
        request.resume()
    }
}

enum Router: String {
    case characterURLString = "https://rickandmortyapi.com/api/character/"
}
