//
//  Extensions.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 22.03.2021.
//

import UIKit

//MARK: CGcolor extension
extension CGColor {
    var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
