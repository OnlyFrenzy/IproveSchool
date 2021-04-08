//
//  CellConfiguratorProtocol.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 31.03.2021.
//

import Foundation

protocol CellConfiguratorProtocol: NSObject {
    var cellIdentifier: String { get }
    var selectionClosure: (() -> Void)? { get set }
}

extension CellConfiguratorProtocol {
    var cellIdentifier: String {
        return Self.className
    }

    var selectionClosure: (() -> Void)? {
        return nil
    }
}
