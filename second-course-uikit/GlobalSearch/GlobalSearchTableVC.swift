//
//  GlobalSearchTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

protocol GlobalSearchTableVCDelegate {

    func userUnsubscribe(group: Group)
    func userSubscribe(group: Group)
}


class GlobalSearchTableVC: UITableViewController {
    
    let allGroupsSearch = allGroups
    var selectedGroups: [Group] = []

    var delegate: GlobalSearchTableVCDelegate?


    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsSearch.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "globalSearchCell", for: indexPath) as? GlobalSearchTableViewCell
        let searchGroup = allGroupsSearch[indexPath.row]
        cell?.globalSearchImageView.image = searchGroup.avaterGroup
        cell?.globalSearchImageView.layer.cornerRadius = 50
        cell?.globalSearchImageView.clipsToBounds = true
        cell?.searchLable.text = searchGroup.name
        cell?.descriptionSearchLable.text = searchGroup.description
        cell?.searchLable.numberOfLines = 2
        cell?.descriptionSearchLable.numberOfLines = 3
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let group = allGroupsSearch[indexPath.row]
        let isSubscribe = selectedGroups.contains { selectedGroups in
            return selectedGroups.id == group.id
        }

        let action: UIContextualAction
        if isSubscribe {
            action = UIContextualAction(style: .destructive, title: "Отписаться", handler: { [weak self ]_, _, complete in

                guard let self = self else { return }

                self.selectedGroups.removeAll(where: { $0.id == group.id })
                self.delegate?.userUnsubscribe(group: group)
                complete(true)
            })

        } else {
            action = UIContextualAction(style: .normal, title: "Подписаться", handler: { [weak self] _, _, complete in

                guard let self = self else { return }

                self.selectedGroups.append(group)
                self.delegate?.userSubscribe(group: group)
                complete(true)

            })
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
