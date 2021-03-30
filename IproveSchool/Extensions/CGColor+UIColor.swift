//
//  CGColor+UIColor.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

extension CGColor {
    var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
