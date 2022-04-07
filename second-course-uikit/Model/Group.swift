//
//  Group.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 29.03.2022.
//

import Foundation
import UIKit


//MARK: - struct Group

struct Group {
    let id: String
    let avaterGroup: UIImage?
    let name: String
    let description: String
}

var allGroups: [Group] = [
    Group(id: "1", avaterGroup: UIImage(named: "Бар Гадкий кайот"), name: "Бар Гадкий кайот", description: "Фото, события бара"),
    Group(id: "2", avaterGroup: UIImage(named: "Где вкусно поесть в лесу"), name: "Где вкусно поесть в лесу", description: "Только правдивые отзывы зверей"),
    Group(id: "3", avaterGroup: UIImage(named: "Детский сад мишутка"), name: "Детский сад мишутка", description: "Детский сад мишутка"),
    Group(id: "4", avaterGroup: UIImage(named: "Детский сад Солнышко"), name: "Детский сад Солнышко", description: "У нас лучше всего вашим детям"),
    Group(id: "5", avaterGroup: UIImage(named: "Звери зоопарка"), name: "Звери зоопарка", description: "Любите ли вы животных, как любим их мы"),
    Group(id: "6", avaterGroup: UIImage(named: "Звериная школа"), name: "Звериная школа", description: "Только с 7 лет"),
    Group(id: "7", avaterGroup: UIImage(named: "Как выглядят лесые животные"), name: "Как выглядят лесые животные", description: "Кдуб любителей лесных животных. Если вы не знаете, как они выглядят, мы вас познакомим"),
    Group(id: "8", avaterGroup: UIImage(named: "Клуб любителей кошек"), name: "Клуб любителей кошек", description: "Породистые кошки леса"),
    Group(id: "9", avaterGroup: UIImage(named: "Лагерь скаутов"), name: "Лагерь скаутов", description: "Мы их научим уважать взрослых ))"),
    Group(id: "10", avaterGroup: UIImage(named: "Лицей номер 17"), name: "Лицей номер 17", description: "Официальная группа ВК. Только самые умные дети"),
    Group(id: "11", avaterGroup: UIImage(named: "Любители огорода"), name: "Любители огорода", description: "Распродажа семян"),
    Group(id: "12", avaterGroup: UIImage(named: "Найди друга"), name: "Найди друга", description: "Если вы одиноки, то эта группа для вас"),
    Group(id: "13", avaterGroup: UIImage(named: "Найди лишнего"), name: "Найди лишнего", description: "Игры на любой вкус"),
    Group(id: "14", avaterGroup: UIImage(named: "Охрана территории"), name: "Охрана территории", description: "Озранное предприятие"),
    Group(id: "15", avaterGroup: UIImage(named: "Рестораны Мишлен"), name: "Рестораны Мишлен", description: "Лучшие рестораны леса"),
    Group(id: "16", avaterGroup: UIImage(named: "Услуги няни"), name: "Услуги няни", description: "Няни от 1 часа до 8 часов в день"),
    Group(id: "17", avaterGroup: UIImage(named: "Уютные квартиры"), name: "Уютные квартиры", description: "Риэлторское агенство")
]



