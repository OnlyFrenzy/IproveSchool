//
//  NSObject+className.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
