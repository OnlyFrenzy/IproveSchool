//
//  ConfigurableHeaderProtocol.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 31.03.2021.
//

import UIKit

protocol ConfigurableHeaderProtocol {
    func configureWithHeaderConfigurator(model: HeaderConfiguratorProtocol) -> UITableViewHeaderFooterView
    func setTurnButtonHandler(handler: ((String) -> ())?)
}
