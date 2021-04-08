//
//  DetailViewController.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 02.04.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private var detailCollectionView: UICollectionView!

    var details: [Detail] = []

    var collectionViewLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (_, env) -> NSCollectionLayoutSection in
            ContactCollectionViewCell.defaultSectionLayout(env: env)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let detailNib = UINib(nibName: ContactCollectionViewCell.className, bundle: nil)
        detailCollectionView.register(detailNib, forCellWithReuseIdentifier: ContactCollectionViewCell.className)
        navigationItem.title = "Details"
        detailCollectionView.dataSource = self
        detailCollectionView.delegate = self
        detailCollectionView.collectionViewLayout = collectionViewLayout
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return details.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCollectionViewCell.className, for: indexPath) as? ContactCollectionViewCell {
            setupBackgroundColor(indexPath: indexPath)
            return item.configureWith(detail: details[indexPath.item])
        }
        return UICollectionViewCell()
    }

    func setupBackgroundColor(indexPath: IndexPath) {
        if details[indexPath.item].gender == .female {
            detailCollectionView.backgroundColor = .systemPink
        }
        if details[indexPath.item].gender == .male {
            detailCollectionView.backgroundColor = .systemBlue
        }
        if details[indexPath.item].gender == .unknown {
            detailCollectionView.backgroundColor = .systemGray
        }
    }
}

struct Detail {
    var name: String
    var portrait: String?
    var gender: Gender
}
