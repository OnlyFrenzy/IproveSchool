//
//  CharacterProvider.swift
//  School
//
//  Created by Михаил Галушкин on 08.04.2021.
//

import Alamofire
import Foundation

enum CharacterProvider: URLRequestBuilder {
    case showCharacters

    var path: String {
        switch self {
        case .showCharacters:
            return "character"
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }

    var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }

    var method: HTTPMethod {
        switch self {
        case .showCharacters:
            return .get
        }
    }
}
