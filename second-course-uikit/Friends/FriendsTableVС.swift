//
//  FriendsPhotoViewController.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 22.03.2022.
//

import UIKit

class FriendsTableVС: UITableViewController {
    
    let friends: [Friend] = [
        Friend(name: "Бурый Мишка", avatar: "Бурый Мишка", photos: ["Бурый Мишка", "Медведь1", "Медведь2", "Медведь3"]),
        Friend(name: "Колючий Ёж", avatar: "Колючий Ёж", photos: ["Колючий Ёж"]),
        Friend(name: "Красивый Олень", avatar: "Красивый Олень", photos: ["Красивый Олень", "КрасивыйОлень1"]),
        Friend(name: "Лесной Олень", avatar: "Лесной Олень", photos: ["Лесной Олень", "ЛеснойОлень1"]),
        Friend(name: "Маленький Козлик", avatar: "Маленький Козлик", photos: ["Маленький Козлик"]),
        Friend(name: "Огненная Белка", avatar: "Огненная Белка", photos: ["Огненная Белка", "Белка1", "Белка2", "Белка3", "Белка4"]),
        Friend(name: "Рыжая Лиса", avatar: "Рыжая Лиса", photos: ["Рыжая Лиса", "Лиса1", "Лиса2", "Лиса3", "Лиса4", "Лиса5"]),
        Friend(name: "Семейство Кабанов", avatar: "Семейство Кабанов", photos: ["Семейство Кабанов"]),
        Friend(name: "Серый Волк", avatar: "Серый Волк", photos: ["Серый Волк", "Волк1"]),
        Friend(name: "Серый Зайка", avatar: "Серый Зайка", photos: ["Серый Зайка", "Заяц1", "Заяц2"])]
    

    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell
        let friend = friends[indexPath.row]
        cell?.friendsImageView.image = UIImage(named: friend.avatar)
        cell?.friendsImageView.layer.cornerRadius = 50
        cell?.friendsImageView.clipsToBounds = true
        cell?.friendsLabel.text = friend.name
        
        return cell ?? UITableViewCell()
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendsTableViewCell,
              let index = tableView.indexPath(for: cell)?.row,
              let photosVC = segue.destination as? PhotoCollectionVC
        else {
            return
        }
        let friend = friends[index]
        photosVC.friendPhotos = friend.photos
    }
    
    
    
}
