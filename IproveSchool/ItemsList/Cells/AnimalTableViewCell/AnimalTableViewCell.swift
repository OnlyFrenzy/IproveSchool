//
//  AnimalTableViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 29.03.2021.
//

import UIKit

class AnimalTableViewCell: StyledTableViewCell {
    
    static let cellId = AnimalTableViewCell.className
    static let sectionName = "Animals"
}

struct Animal: DefaultCell {
    var sectionName: String
    var cellId: String
    var name: String
    var portrait: UIImage?
}
