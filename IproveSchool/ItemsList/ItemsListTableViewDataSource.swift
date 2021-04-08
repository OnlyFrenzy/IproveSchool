//
//  ContactTableViewDataSource.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

struct SectionModel {
    var sectionName: HeaderConfiguratorProtocol
    var sectionCells: [CellConfiguratorProtocol]
    var sectionStage: Bool

    internal init(sectionName: HeaderConfiguratorProtocol, sectionCells: [CellConfiguratorProtocol]) {
        self.sectionName = sectionName
        self.sectionCells = sectionCells
        sectionStage = true
    }
}

class ItemsListTableViewDataSource: NSObject {
    private var models: [SectionModel]
    private var headerModels: String
    private var sectionStage: Bool

    internal init(models: [SectionModel], headerModels: String, sectionStage: Bool) {
        self.models = models
        self.headerModels = headerModels
        self.sectionStage = sectionStage
    }
}

extension ItemsListTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = models[section].sectionName
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModels) as? ConfigurableHeaderProtocol {
            header.setTurnButtonHandler { [weak self] (headerText: String) in
                guard let self = self else { return }
                guard let currentSection = self.models.enumerated().first(where: { (modelEnumerated) -> Bool in
                    headerText == modelEnumerated.element.sectionName.headerIdentifier
                })?.offset else { return }
                print(currentSection)
                if self.models[section].sectionStage == true {
                    self.models[section].sectionStage = false
                } else {
                    self.models[section].sectionStage = true
                }
                tableView.reloadSections(IndexSet(integer: currentSection), with: .automatic)
            }
            return header.configureWithHeaderConfigurator(model: model)
        }
        return UITableViewHeaderFooterView()
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 70
    }

    func numberOfSections(in _: UITableView) -> Int {
        return models.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        if models[section].sectionStage {
            return models[section].sectionCells.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].sectionCells[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? ConfigurableCellProtocol {
            return cell.configureWithCellConfigurator(model: model)
        }
        return UITableViewCell()
    }
}

extension ItemsListTableViewDataSource: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].sectionCells[indexPath.row]
        model.selectionClosure?()
    }
}
