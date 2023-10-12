//
//  Product.swift
//  FlowerShop
//
//  Created by Ник К on 05.10.2023.
//

import Foundation

struct Product {
    var id: String
    var title: String
    var imageURL: String = ""
    var price: Int
    var descript: String
    //    var ordersCount: Int
    //    var isRecommend: Bool = false
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["descript"] = self.descript
        return repres
    }
}
