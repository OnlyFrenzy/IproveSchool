//
//  ContactsViewController.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

class ItemsListViewController: UIViewController {
    
    let headerIdentifier = String(describing: CustomHeaderTableViewCell.self)
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var characters: [Character] = []
    private let viewModel: ItemListViewModelProtocol = ItemListViewModel()
    private var dataSource: ItemsListTableViewDataSource!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        viewModel.loadContacts { (characters) in
            self.characters = characters
            print(self.characters)
            let models = self.configureCharactersModels()
            let headerModels = self.configureHeaderModels()
            let sectionStage = true
            self.dataSource = ItemsListTableViewDataSource(models: models, headerModels: headerModels, sectionStage: sectionStage)
            self.headerConfig()
            self.tableViewCellConfig()
            self.navigationItem.title = "Characters"
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
        }
    }
    
    private func headerConfig() {
        let headerNib = UINib(nibName: headerIdentifier, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    private func tableViewCellConfig() {
        let characterCellNib = UINib(nibName: CharacterTableViewCell.className, bundle: nil)
        tableView.register(characterCellNib, forCellReuseIdentifier: RaMCharacter.className)
    }
    
    func pushDetailCharacter(item: RaMCharacter) {
        let detailStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = detailStoryboard.instantiateViewController(identifier: DetailViewController.className) as? DetailViewController else { return }
        detailViewController.details.append(Detail(name: item.name, portrait: item.portrait, gender: item.gender))
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func configureCharactersModels() -> [SectionModel] {
        var charactersModels: [SectionModel] = []
        var tmpCharacters: [CellConfiguratorProtocol] = []
        for index in 0..<characters.count{
            let character = RaMCharacter(name: characters[index].name, portrait: characters[index].image, gender: characters[index].gender)
            character.selectionClosure = { [weak self] in
                self?.pushDetailCharacter(item: character)
            }
            tmpCharacters.append(character)
        }
        charactersModels.append(SectionModel(sectionName: Header(headerIdentifier: "Characters"), sectionCells: tmpCharacters))
        return charactersModels
    }
    
    func configureHeaderModels() -> String {
        return headerIdentifier
    }
    
}

struct DetailScreenStruct {
    var name: String
    var portrait: UIImage?
}



