//
//  ItemListViewModel.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 05.04.2021.
//

import Foundation
import Alamofire

protocol ItemListViewModelProtocol {
    func loadContacts(completion: @escaping ([Character]) -> ())
}

class ItemListViewModel: NSObject, ItemListViewModelProtocol {
    func loadContacts(completion: @escaping ([Character]) -> ()) {
        guard let url = try? Constants.characterURLString.asURL() else {return}
        let request = Session.default.request(url, method: .get)
        request.response { (responce) in
            switch responce.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                guard let data = data else { return }
                let decoder = JSONDecoder()
                guard let result = try? decoder.decode(CharacterResponce.self, from: data) else { return }
                completion(result.results)
            }
        }
        .validate()
        request.resume()
    }
    
    private struct Constants {
        static var characterURLString = "https://rickandmortyapi.com/api/character/"
    }
}
