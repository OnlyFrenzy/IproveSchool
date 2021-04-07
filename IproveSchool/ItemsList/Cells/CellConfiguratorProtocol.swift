//
//  CellConfiguratorProtocol.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 31.03.2021.
//

import Foundation

protocol CellConfiguratorProtocol: NSObject {
    var cellIdentifier: String {get}
    var selectionClosure: (() -> ())? {get set}
}

extension CellConfiguratorProtocol {
    var cellIdentifier: String {
        get {
            return Self.className
        }
    }
    
    var selectionClosure: (() -> ())? {
        get {
            return nil
        }
    }
}
