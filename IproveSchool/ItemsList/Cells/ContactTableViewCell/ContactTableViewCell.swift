//
//  CantactTableViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

class ContactTableViewCell: StyledTableViewCell {
    
    static let cellId = ContactTableViewCell.className
    static let sectionName = "Peoples"
}

struct Contact: DefaultCell {
    var sectionName: String
    var cellId: String
    var name: String
    var portrait: UIImage?
}

