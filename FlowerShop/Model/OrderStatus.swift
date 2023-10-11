//
//  OrderStatus.swift
//  FlowerShop
//
//  Created by Ник К on 10.10.2023.
//

import Foundation

enum OrderStatus: String {
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменён"
}
