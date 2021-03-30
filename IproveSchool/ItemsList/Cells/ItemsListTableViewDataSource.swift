//
//  ContactTableViewDataSource.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 26.03.2021.
//

import UIKit

class ItemsListTableViewDataSource: NSObject {
    
    private var models: [[DefaultCell]]
    private var arrayOfData: [ExpandedModel]
    internal init(models: [[DefaultCell]], arrayOfData: [ExpandedModel]) {
        self.models = models
        self.arrayOfData = arrayOfData
    }
//    internal init(models: [[DefaultCell]]) {
//        self.models = models
//    }
}

extension ItemsListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: tableView.frame.minX, y: 0, width: tableView.frame.width, height: 70))
        let label = UILabel(frame: CGRect(x: 16, y: view.frame.height / 2 - 10, width: view.frame.width - 32, height: 20))
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.text = titleTextOfSection(section: section)
        view.addSubview(label)
        view.backgroundColor = .black
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        view.addGestureRecognizer(tapGesture)
        return view
    }
    
    private func titleTextOfSection(section: Int) -> String {
        if section == 0 {
            return "Section \(ContactTableViewCell.sectionName) is visible"
        }
        if section == 1 {
            return "Section \(AnimalTableViewCell.sectionName) is visible"
        }
        return ""
    }
    
    @objc
    func didTap(sender: UITapGestureRecognizer) {
        if sender.numberOfTapsRequired % 2 == 5 {
        print("govno")
        }
        if sender.numberOfTapsRequired % 2 == 0 {
        print("jhopa")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfData.count
//        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !arrayOfData[section].isExpanded {
            return 0
        }
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section][indexPath.row]
        let dequeedCell = tableView.dequeueReusableCell(withIdentifier: model.cellId, for: indexPath)
        guard let cell = dequeedCell as? StyledTableViewCell else {return UITableViewCell()}
        
        return cell.setupTableViewCell(model)
    }
    
}

extension ItemsListTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
