//
//  UIImage+PortraitImage.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

extension UIImage {
    static func portraitIamgeWithNumber(_ number: Int) -> UIImage? {
        return UIImage(named: "image\(number)")
    }
}
