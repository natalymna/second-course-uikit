//
//  News.swift
//  second-course-uikit
//
//  Created by Natalya Murygina on 15.04.2022.
//

import Foundation
import UIKit

struct New {
    let id: String
    let avatar: UIImage?
    let avatarName: String
    let date: String
    let newsName: String
    let bodyNews: String
    let photoNews: UIImage?

    static var news = [
        New(id: "1", avatar: UIImage(named: "Где вкусно поесть в лесу"), avatarName: "Хома", date: "15.04.2022", newsName: "В лесу до конца года планируют открыть гостиницу Теремок", bodyNews: "Строительство пятизвездочной гостиницы Теремок в лесу планируется завершить до конца текущего года, что увеличит комфортабельный номерной фонд леса и повысит уровень предоставляемых туруслуг.", photoNews: UIImage(named: "hotel")),
        New(id: "2", avatar: UIImage(named: "Где вкусно поесть в лесу"), avatarName: "Хома", date: "14.04.2022", newsName: "Один ресторан в лесу получил звезду Michelin", bodyNews: "Michelin в четверг вечером в концертном зале «Зарядье» представил свой первый путеводитель, посвященный лесным ресторанам. Всего в первую часть лесного выпуска «Красного гида» были включены 5 заведений.\n«Зеленой звездой» Michelin в гиде отметили один ресторан: Biologie (шеф — Белый медведь). Этим знаком отмечают поваров, которые учитывают сезонность, сокращают пищевые отходы и используют инновации, заботясь о будущем.", photoNews: UIImage(named: "eat"))
    ]

}
