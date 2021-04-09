//
//  HeaderTableViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 31.03.2021.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewHeaderFooterView, ConfigurableHeaderProtocol {
    func setTurnButtonHandler(handler: ((String) -> Void)?) {
        turnButtonHandler = handler
    }

    var turnButtonHandler: ((String) -> Void)?

    var headerButton: UIButton?

    @IBOutlet private var turnButton: UIButton!
    @IBOutlet private var titleLabel: UILabel!

    func configureWithHeaderConfigurator(model: HeaderConfiguratorProtocol) -> UITableViewHeaderFooterView {
        titleLabel.text = model.headerIdentifier
        turnButton.addTarget(self, action: #selector(didClickTurnButton), for: .touchUpInside)
        return self
    }

    @objc
    func didClickTurnButton() {
        turnButtonHandler?(titleLabel.text ?? "")
    }
}

struct Header: HeaderConfiguratorProtocol {
    var headerIdentifier: String
}
