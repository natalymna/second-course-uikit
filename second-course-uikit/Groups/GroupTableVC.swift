//
//  GroupTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

/// GroupTableVC
class GroupTableVC: UITableViewController {

    //MARK: - properties
    var gettGroups = GroupsService()
    
    var groups: [Groups] = []
    
    
    //MARK: - LifeCycle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        gettGroups.gettingDataGroups { [weak self] groups in
            guard let self = self else { return }
            DispatchQueue.main.async {
            self.groups = groups
            self.tableView.reloadData()
            }
        }

    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    /// cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupTableViewCell
        let selectGroup = groups[indexPath.row]
//        cell?.groupImageView.image = selectGroup.photoGroup
        cell?.groupImageView.loadImage(with: groups[indexPath.item].photoGroup)
        cell?.groupImageView.layer.cornerRadius = 50
        cell?.groupImageView.clipsToBounds = true
        cell?.groupLable.text = selectGroup.name
        cell?.groupDescriptionLable.text = selectGroup.name
        cell?.groupLable.numberOfLines = 2
        cell?.groupDescriptionLable.numberOfLines = 3
        
        return cell ?? UITableViewCell()
    }


    //MARK: - Actions
    /// trailingSwipeActionsConfigurationForRowAt
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Удалить",
            handler: { [weak self] _, _, block in

            self?.groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            block(true)
        })
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    /// prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let globalSearchTVC = segue.destination as? GlobalSearchTableVC {
//            globalSearchTVC.selectedGroups = selectedGroups
//            globalSearchTVC.delegate = self
        }
    }


    //MARK: - IBAction - Navigation
    @IBAction func nextScreenTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let globalSearchTVC = storyboard.instantiateViewController(withIdentifier: "GlobalSearchTableVC")

//        navigationController?.delegate = self

        navigationController?.pushViewController(globalSearchTVC, animated: true)
    }
}

//extension GroupTableVC: UINavigationControllerDelegate {
//
//    func navigationController(_ navigationController: UINavigationController,
//                              animationControllerFor operation: UINavigationController.Operation,
//                              from fromVC: UIViewController,
//                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        switch operation {
//        case .push:
//            return TransitionAnimator(isPresenting: true)
//        case .pop:
//            return TransitionAnimator(isPresenting: false)
//        default:
//            return nil
//        }
//    }
//
//}


//MARK: - GroupTableVC
//extension GroupTableVC: GlobalSearchTableVCDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        selectedGroups = []
//
//        if searchText == "" {
//            selectedGroups = selectedGroups
//        }
//
//        for grup in selectedGroups {
//            if selectedGroups[IndexPath.item].name.uppercased().contains(searchText.uppercased()) {
//                selectedGroups.append(group)
//            }
//        }
//        self.tableView.reloadData()
//    }

//    /// userSubscribe
//    /// - Parameter group: Group
//    func userSubscribe(group: SearchGroupsData) {
//        selectedGroups.append(group)
//        tableView.reloadData()
//    }
//
//    /// userUnsubscribe
//    /// - Parameter group: Group
//    func userUnsubscribe(group: SearchGroupsData) {
//        selectedGroups.removeAll(where: { $0.id == group.id })
//        tableView.reloadData()
//    }

//}
