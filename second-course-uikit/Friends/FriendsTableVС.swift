//
//  FriendsPhotoViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 22.03.2022.
//

import UIKit

struct CategoryFriend {
    let category: Character
    var friends: [Friend]
}

class FriendsTableVС: UITableViewController {
    
    var sortedFriends: [CategoryFriend] {
        var result = [CategoryFriend]()

        for friend in friends {
            guard let character = friend.name.first else {
                continue
            }
            if let sortedIndex = result.firstIndex(where: { $0.category == character}) {
                result[sortedIndex].friends.append(friend)
            } else {
                let sortedFriend = CategoryFriend(category: character, friends: [friend])
                result.append(sortedFriend)
            }
        }
        return result
    }
    

    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CategoryHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "header")
        
    }
    
    //MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoryFriend = sortedFriends[section]
        return categoryFriend.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell
        let categoryFriend = sortedFriends[indexPath.section]
        let friend = categoryFriend.friends[indexPath.row]
        cell?.friendsImageView.image = UIImage(named: friend.avatar)
        cell?.friendsImageView.layer.cornerRadius = 50
        cell?.friendsImageView.clipsToBounds = true
        cell?.friendsLabel.text = friend.name
        
        return cell ?? UITableViewCell()
        
    }


    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CategoryHeaderView
        let categoryFriend = sortedFriends[section]
        view?.categoryHeaderLabel.text = String(categoryFriend.category)
        view?.contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return view
    }


    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendsTableViewCell,
              let index = tableView.indexPath(for: cell),
              let photosVC = segue.destination as? PhotoCollectionVC else { return }


        let categoryFriend = sortedFriends[index.section]
        let friend = categoryFriend.friends[index.row]

        let friendIndex = friends.firstIndex(where: { $0.id == friend.id })
        photosVC.friendIndex = friendIndex ?? 0
        photosVC.title = friend.name
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
