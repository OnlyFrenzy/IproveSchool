//
//  SettingsSettingsModuleAssembly.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 07/04/2021.
//  Copyright © 2021 OnlyFrenzy. All rights reserved.
//

import Swinject

class SettingsModuleAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ModuleFactory<SettingsViewController>.self, name: SettingsViewController.className) { r in
            ModuleFactory<SettingsViewController>(handler: {
                r.resolve(SettingsViewController.self)!
            })
        }

        container.register(SettingsViewController.self) { r in
            let c: SettingsViewController = .fromStoryboard()

            c.viewModel = r.resolve(SettingsViewModel.self)

            return c
        }

        container.register(SettingsViewModel.self) { _ in
            let c = SettingsViewModel()

            return c
        }
    }
}
