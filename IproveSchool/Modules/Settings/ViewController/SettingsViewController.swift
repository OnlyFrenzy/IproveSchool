//
//  SettingsSettingsViewController.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 07/04/2021.
//  Copyright © 2021 OnlyFrenzy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var viewModel: SettingsViewModel!
    @IBOutlet var rootView: SettingsView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Decoration
        rootView.decorate()
    }
}
