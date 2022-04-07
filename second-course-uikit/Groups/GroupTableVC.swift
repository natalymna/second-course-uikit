//
//  GroupTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

class GroupTableVC: UITableViewController {
    
    var selectedGroups: [Group] = []
    
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstGroup = allGroups.first {
            selectedGroups.append(firstGroup)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupTableViewCell
        let selectGroup = selectedGroups[indexPath.row]
        cell?.groupImageView.image = selectGroup.avaterGroup
        cell?.groupImageView.layer.cornerRadius = 50
        cell?.groupImageView.clipsToBounds = true
        cell?.groupLable.text = selectGroup.name
        cell?.groupDescriptionLable.text = selectGroup.description
        cell?.groupLable.numberOfLines = 2
        cell?.groupDescriptionLable.numberOfLines = 3
        
        return cell ?? UITableViewCell()
    }


    //MARK: - Actions

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Удалить", handler: { [weak self] _, _, block in
            self?.selectedGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            block(true)
        })
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let globalSearchTVC = segue.destination as? GlobalSearchTableVC {
            globalSearchTVC.selectedGroups = selectedGroups
            globalSearchTVC.delegate = self
        }
    }
    
}

extension GroupTableVC: GlobalSearchTableVCDelegate {
    func userSubscribe(group: Group) {
        selectedGroups.append(group)
        tableView.reloadData()
    }

    func userUnsubscribe(group: Group) {
        selectedGroups.removeAll(where: { $0.id == group.id })
        tableView.reloadData()
    }

}
