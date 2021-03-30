//
//  DefaultCellProtocol.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 29.03.2021.
//

import UIKit

protocol DefaultCell {
    var sectionName: String {get}
    var cellId: String {get}
    var name: String {get}
    var portrait: UIImage? {get}
}
