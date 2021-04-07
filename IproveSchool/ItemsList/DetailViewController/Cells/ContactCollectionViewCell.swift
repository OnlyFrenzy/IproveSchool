//
//  ContactCollectionViewCell.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 02.04.2021.
//

import UIKit
import  Kingfisher

class ContactCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var portraitImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static func defaultSectionLayout(env:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(160))
        let subItems = [itemLayout]
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subItems)
        
        groupLayout.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        groupLayout.interItemSpacing = .flexible(100)
        return NSCollectionLayoutSection(group: groupLayout)
    }
    
    func configureWith(detail: Detail) -> Self {
        portraitImageView.kf.setImage(with: URL(string: detail.portrait!))
        titleLabel.text = detail.name
        DispatchQueue.main.async {
            self.portraitImageView.layer.cornerRadius = self.frame.height / 5.0
            self.portraitImageView.layer.masksToBounds = true
        }
        return self
    }
}
