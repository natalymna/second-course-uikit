//
//  FriendsPhotoViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 22.03.2022.
//

import UIKit

/// CategoryFriend
struct CategoryFriend {
    let category: Character
    var users: [User]
}

/// FriendsTableVС
class FriendsTableVС: UITableViewController {

    //MARK: - properties

    private var friends: [User] = [User]()
    private var getFriends = UserService()
    var sortedFriends = [CategoryFriend]()


    //MARK: - LifeCycle
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CategoryHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "header")

        getFriends.gettingDataFriends { [weak self] users in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.friends = users
                self.sortedFriends = self.groupFriends()
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - groupFriends

    func groupFriends() -> [CategoryFriend] {
        var result = [CategoryFriend]()

        for friend in friends {
            guard let character: Character = friend.lastName.first else { continue }
            if let sortedIndex = result.firstIndex(where: { $0.category == character}) {
                result[sortedIndex].users.append(friend)
            } else {
                let sortedFriend = CategoryFriend(category: character, users: [friend])
                result.append(sortedFriend)
            }
        }
        return result
    }


    //MARK: - Table view data source
    ///numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.count
    }

    ///numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFriends[section].users.count
    }


    ///dequeueReusableCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell
        let categoryFriend = sortedFriends[indexPath.section]
        let friend = categoryFriend.users[indexPath.row]

        guard let path = URL(string: friend.avatar),
              let imageData = try? Data(contentsOf: path, options: .uncached),
              let userAvatar = UIImage(data: imageData)
        else {
            return UITableViewCell()
        }

        cell?.friendsImageView.image = userAvatar
        cell?.friendsImageView.layer.cornerRadius = 50
        cell?.friendsImageView.clipsToBounds = true
        cell?.friendsLabel.text = "\(friend.firstName) \(friend.lastName)"

        return cell ?? UITableViewCell()

    }


    ///viewForHeaderInSection
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CategoryHeaderView
        let categoryFriend = sortedFriends[section]
        view?.categoryHeaderLabel.text = String(categoryFriend.category)
        view?.contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return view
    }


    ///heightForHeaderInSection
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }


    //MARK: - Navigation
    ///prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PhotoCollectionVC {
            guard
                let vc = segue.destination as? PhotoCollectionVC,
                let indexPathSection = tableView.indexPathForSelectedRow?.section,
                let indexPathRow = tableView.indexPathForSelectedRow?.row
            else {
                return
            }
            let section = sortedFriends[indexPathSection]
//            let firstName = section.users[indexPathRow].firstName
            let friendId = section.users[indexPathRow].id
//            let photo = section.users[indexPathRow].avatar

            vc.userID = String(friendId)
        }
    }
}



//extension FriendsTableVС: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//    }
//}



