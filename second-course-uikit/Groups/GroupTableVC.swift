//
//  GroupTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

class GroupTableVC: UITableViewController {
    
    var selectedGroups: [Group] = [
        Group(avaterGroup: UIImage(named: "Бар Гадкий кайот"), name: "Бар Гадкий кайот", description: "Фото, события бара"),
        Group(avaterGroup: UIImage(named: "Где вкусно поесть в лесу"), name: "Где вкусно поесть в лесу", description: "Только правдивые отзывы зверей"),
        Group(avaterGroup: UIImage(named: "Детский сад мишутка"), name: "Детский сад мишутка", description: "Детский сад мишутка"),
        Group(avaterGroup: UIImage(named: "Детский сад Солнышко"), name: "Детский сад Солнышко", description: "У нас лучше всего вашим детям")]
    
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
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


    
}
