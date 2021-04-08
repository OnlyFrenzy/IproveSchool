//
//  AnimalTableViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 29.03.2021.
//

import Kingfisher
import UIKit

class CharacterTableViewCell: UITableViewCell, ConfigurableCellProtocol {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var portraitImageView: UIImageView!

    func configureWithCellConfigurator(model: CellConfiguratorProtocol) -> UITableViewCell {
        guard let characterModel = model as? RaMCharacter else { return self }
        titleLabel.text = characterModel.name
        portraitImageView.kf.setImage(with: URL(string: characterModel.portrait))
        return self
    }
}

class RaMCharacter: NSObject, CellConfiguratorProtocol {
    var selectionClosure: (() -> Void)?

    var name: String
    var portrait: String
    var gender: Gender

    init(name: String, portrait: String, gender: Gender) {
        self.name = name
        self.portrait = portrait
        self.gender = gender
    }
}
