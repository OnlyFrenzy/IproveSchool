//
//  UIViewController+StoryboardInitable.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 07.04.2021.
//

import UIKit

extension UIViewController {
    static func fromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: Self.className, bundle: nil)

        if let controller = storyboard.instantiateInitialViewController() as? Self {
            return controller
        } else if let controller = storyboard.instantiateViewController(identifier: Self.className) as? Self {
            return controller
        }

        fatalError("No storyboard associated with \(Self.className)")

        return UIViewController() as! Self
    }
}
