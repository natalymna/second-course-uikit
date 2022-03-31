//
//  GlobalSearchTableVC.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 25.03.2022.
//

import UIKit

class GlobalSearchTableVC: UITableViewController {
    
    let groups: [Group] = [
        Group(avaterGroup: UIImage(named: "Бар Гадкий кайот"), name: "Бар Гадкий кайот", description: "Фото, события бара"),
        Group(avaterGroup: UIImage(named: "Где вкусно поесть в лесу"), name: "Где вкусно поесть в лесу", description: "Только правдивые отзывы зверей"),
        Group(avaterGroup: UIImage(named: "Детский сад мишутка"), name: "Детский сад мишутка", description: "Детский сад мишутка"),
        Group(avaterGroup: UIImage(named: "Детский сад Солнышко"), name: "Детский сад Солнышко", description: "У нас лучше всего вашим детям"),
        Group(avaterGroup: UIImage(named: "Звери зоопарка"), name: "Звери зоопарка", description: "Любите ли вы животных, как любим их мы"),
        Group(avaterGroup: UIImage(named: "Звериная школа"), name: "Звериная школа", description: "Только с 7 лет"),
        Group(avaterGroup: UIImage(named: "Как выглядят лесые животные"), name: "Как выглядят лесые животные", description: "Кдуб любителей лесных животных. Если вы не знаете, как они выглядят, мы вас познакомим"),
        Group(avaterGroup: UIImage(named: "Клуб любителей кошек"), name: "Клуб любителей кошек", description: "Породистые кошки леса"),
        Group(avaterGroup: UIImage(named: "Лагерь скаутов"), name: "Лагерь скаутов", description: "Мы их научим уважать взрослых ))"),
        Group(avaterGroup: UIImage(named: "Лицей номер 17"), name: "Лицей номер 17", description: "Официальная группа ВК. Только самые умные дети"),
        Group(avaterGroup: UIImage(named: "Любители огорода"), name: "Любители огорода", description: "Распродажа семян"),
        Group(avaterGroup: UIImage(named: "Найди друга"), name: "Найди друга", description: "Если вы одиноки, то эта группа для вас"),
        Group(avaterGroup: UIImage(named: "Найди лишнего"), name: "Найди лишнего", description: "Игры на любой вкус"),
        Group(avaterGroup: UIImage(named: "Охрана территории"), name: "Охрана территории", description: "Озранное предприятие"),
        Group(avaterGroup: UIImage(named: "Рестораны Мишлен"), name: "Рестораны Мишлен", description: "Лучшие рестораны леса"),
        Group(avaterGroup: UIImage(named: "Услуги няни"), name: "Услуги няни", description: "Няни от 1 часа до 8 часов в день"),
        Group(avaterGroup: UIImage(named: "Уютные квартиры"), name: "Уютные квартиры", description: "Риэлторское агенство")
    ]


    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "globalSearchCell", for: indexPath) as? GlobalSearchTableViewCell
        let searchGroup = groups[indexPath.row]
        cell?.globalSearchImageView.image = searchGroup.avaterGroup
        cell?.globalSearchImageView.layer.cornerRadius = 50
        cell?.globalSearchImageView.clipsToBounds = true
        cell?.searchLable.text = searchGroup.name
        cell?.descriptionSearchLable.text = searchGroup.description
        cell?.searchLable.numberOfLines = 2
        cell?.descriptionSearchLable.numberOfLines = 3
        
        return cell ?? UITableViewCell()
    }
    
    
    
}
