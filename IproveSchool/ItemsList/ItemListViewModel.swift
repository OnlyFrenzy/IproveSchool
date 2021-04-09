//
//  ItemListViewModel.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 05.04.2021.
//

import Alamofire
import Foundation

protocol ItemListViewModelProtocol {
    func loadCharacters(completion: @escaping ([Character]) -> Void)
}

class ItemListViewModel: NSObject, ItemListViewModelProtocol {
    let networkService = NetworkManager<CharacterProvider>()

    func loadCharacters(completion: @escaping ([Character]) -> Void) {
        networkService.load(service: .showCharacters, decodeType: CharacterResponse.self) { [completion] result in
            switch result {
            case let .success(response):
                let characters = response.results
                completion(characters)
            case let .failure(error):
                print(error)
            }
        }
    }
}
