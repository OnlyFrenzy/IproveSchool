//
//  ConfigurableCellProtocol.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 31.03.2021.
//

import UIKit

protocol ConfigurableCellProtocol {
    func configureWithCellConfigurator(model: CellConfiguratorProtocol) -> UITableViewCell
}
