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
    let networkService = NetworkService()

    func loadCharacters(completion: @escaping ([Character]) -> Void) {
        networkService.requestLoad(link: .characterURLString, completion: completion)
//        networkService.requestLoad(link: .characterURLString) { characters in
//            completion(characters)
//        }
    }
}
