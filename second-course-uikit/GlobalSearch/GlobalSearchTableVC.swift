//
//  GlobalSearchTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

/// GlobalSearchTableVCDelegate
protocol GlobalSearchTableVCDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)

//    func userUnsubscribe(group: SearchGroups)
//    func userSubscribe(group: SearchGroups)
}


/// GlobalSearchTableVC
class GlobalSearchTableVC: UITableViewController {


    //MARK: - properties
    var getSearchGroups = GlobalSearchService()
    
    var allGroupsSearch = [SearchGroups]()
    var selectedGroups: [SearchGroups] = []

    var filteredGroups: [SearchGroups] = []

    var delegate: GlobalSearchTableVCDelegate?

    let searchText = "группа"


    //MARK: - IBOutlets
    @IBOutlet weak var allGroupsSearchBar: UISearchBar!


    //MARK: - LifeCycle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        getSearchGroups.gettingDataSearchGroups(searchText: searchText) { [weak self] groups in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.allGroupsSearch = groups
                self.selectedGroups = groups
                self.tableView.reloadData()
            }
        }

        filteredGroups = allGroupsSearch

        allGroupsSearchBar.delegate = self

        
    }
    
    // MARK: - Table view data source
    /// numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.count
    }
    
    /// dequeueReusableCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "globalSearchCell",
            for: indexPath) as? GlobalSearchTableViewCell
        
        let searchGroup = filteredGroups[indexPath.row]
        cell?.globalSearchImageView.loadImage(with: filteredGroups[indexPath.item].photoSearchGroup)
        cell?.globalSearchImageView.layer.cornerRadius = 50
        cell?.globalSearchImageView.clipsToBounds = true
        cell?.searchLable.text = searchGroup.name
        cell?.descriptionSearchLable.text = searchGroup.name
        cell?.searchLable.numberOfLines = 2
        cell?.descriptionSearchLable.numberOfLines = 3
        
        return cell ?? UITableViewCell()
    }


    /// trailingSwipeActionsConfigurationForRowAt
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
//                self.delegate?.userUnsubscribe(group: group)
                complete(true)
            })

        } else {
            action = UIContextualAction(style: .normal, title: "Подписаться", handler: { [weak self] _, _, complete in

                guard let self = self else { return }

                self.selectedGroups.append(group)
//                self.delegate?.userSubscribe(group: group)
                complete(true)

            })
        }
        return UISwipeActionsConfiguration(actions: [action])
    }


    //MARK: - IBAction - Navigation
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}


///GlobalSearchTableVC
extension GlobalSearchTableVC: UISearchBarDelegate {

    ///searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateFilteredResult(searchText: searchText)
    }


    ///updateFilteredResult
    func updateFilteredResult(searchText: String) {
        guard !searchText.isEmpty else {
            filteredGroups = allGroupsSearch
            tableView.reloadData()
            return
        }
        filteredGroups = allGroupsSearch.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}
