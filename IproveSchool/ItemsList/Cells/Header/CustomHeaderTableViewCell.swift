//
//  HeaderTableViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 31.03.2021.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewHeaderFooterView, ConfigurableHeaderProtocol {
    func setTurnButtonHandler(handler: ((String) -> ())?) {
        self.turnButtonHandler = handler
    }
    
    var turnButtonHandler: ((String) -> ())?
    
    var headerButton: UIButton?

    @IBOutlet private weak var turnButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
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
