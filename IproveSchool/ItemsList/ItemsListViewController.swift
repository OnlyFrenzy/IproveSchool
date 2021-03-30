//
//  ContactsViewController.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

class ItemsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var names:[String] =
        ["Jan Hale",
        "Bernice Charles",
        "Otis Tucker",
        "Kennith Patel",
        "Carter Ramos",
        "Morton Pratt",
        "Bertie Miles",
        "Chong Chen",
        "Tisha Wiggins",
        "Mckinley Kaiser"]
    
    private var animals:[String] =
        ["Dog",
         "Cat",
         "Lion"
        ]
    
    var arrayOfData = [ExpandedModel]()
    
    private var dataSource: ItemsListTableViewDataSource!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        let models = configureModels()
        dataSource = ItemsListTableViewDataSource(models: models, arrayOfData: arrayOfData)
        let contactCellNib = UINib(nibName: ContactTableViewCell.className, bundle: nil)
        tableView.register(contactCellNib, forCellReuseIdentifier: ContactTableViewCell.className)
        let animalCellNib = UINib(nibName: AnimalTableViewCell.className, bundle: nil)
        tableView.register(animalCellNib, forCellReuseIdentifier: AnimalTableViewCell.className)
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
    }
    
    func configureModels() -> [[DefaultCell]] {
        var models:[[DefaultCell]] = []
        var contacts: [DefaultCell] = []
        for index in 0..<names.count {
            let person = Contact(sectionName: ContactTableViewCell.sectionName, cellId: ContactTableViewCell.cellId, name: names[index], portrait: UIImage.portraitIamgeWithNumber(index))
            contacts.append(person)
        }
        models.append(contacts)
        arrayOfData.append(ExpandedModel(isExpanded: true, array: contacts))
        var beasts: [DefaultCell] = []
        for index in 0..<animals.count {
            let animal = Animal(sectionName: AnimalTableViewCell.sectionName, cellId: AnimalTableViewCell.cellId, name: animals[index], portrait: UIImage.portraitIamgeWithNumber(index + 10) )
            beasts.append(animal)
        }
        models.append(beasts)
        arrayOfData.append(ExpandedModel(isExpanded: true, array: beasts))
        return models
    }
}

struct ExpandedModel {
    var isExpanded: Bool
    let array: [DefaultCell]
}


