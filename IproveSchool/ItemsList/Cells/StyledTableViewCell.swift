//
//  StyledTableViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 29.03.2021.
//

import UIKit

class StyledTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tmpImageView: UIImageView!
    @IBOutlet weak var tmpTitleLabel: UILabel!
    
    func setupTableViewCell(_ model: DefaultCell) -> Self {
        tmpTitleLabel.text = model.name
        tmpImageView.image = model.portrait
        return self
    }
}
