//
//  GlobalSearchTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit
import RealmSwift

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

    private let realmService = RealmCashService()

    private var groupResponseSearch: Results<SearchGroups>? {
        try? realmService.read(SearchGroups.self)
    }

    var allGroupsSearch = [SearchGroups]()
    var selectedGroups: [SearchGroups] = []

    var filteredGroups: [SearchGroups] = []

    var delegate: GlobalSearchTableVCDelegate?

    let searchText = "группа"

    private var searchToken: NotificationToken?


    //MARK: - IBOutlets
    @IBOutlet weak var allGroupsSearchBar: UISearchBar!


    //MARK: - LifeCycle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        getSearchGroups.gettingDataSearchGroups(searchText: searchText)
        createNotificationTokenForSearchGroup()

        filteredGroups = allGroupsSearch

        allGroupsSearchBar.delegate = self

        
    }
    
    // MARK: - Table view data source
    /// numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupResponseSearch?.count ?? 0
    }
    
    /// dequeueReusableCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "globalSearchCell",
            for: indexPath) as? GlobalSearchTableViewCell
        if let filteredGroups = groupResponseSearch {
            let searchGroup = filteredGroups[indexPath.row]
            cell?.globalSearchImageView.loadImage(with: filteredGroups[indexPath.item].photoSearchGroup)
            cell?.globalSearchImageView.layer.cornerRadius = 50
            cell?.globalSearchImageView.clipsToBounds = true
            cell?.searchLable.text = searchGroup.name
            cell?.descriptionSearchLable.text = searchGroup.name
            cell?.searchLable.numberOfLines = 2
            cell?.descriptionSearchLable.numberOfLines = 3
        }
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


//MARK: - Private
private extension GlobalSearchTableVC {
    func createNotificationTokenForSearchGroup() {
        searchToken = groupResponseSearch?.observe { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .initial(let groupsData):
                print("DBG notif token", groupsData.count)
            case .update(_,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                let deletionsIndexPath = deletions.map { IndexPath(row: $0, section: 0) }
                let insertionsIndexPath = insertions.map { IndexPath(row: $0, section: 0) }
                let modificationsIndexPath = modifications.map { IndexPath(row: $0, section: 0) }
                DispatchQueue.main.async {
                    self.tableView.beginUpdates()
                    self.tableView.deleteRows(at: deletionsIndexPath, with: .automatic)
                    self.tableView.insertRows(at: insertionsIndexPath, with: .automatic)
                    self.tableView.reloadRows(at: modificationsIndexPath, with: .automatic)
                    self.tableView.endUpdates()
                }
            case .error(let error):
                print("DBG token error", error)
            }
        }
    }
}
