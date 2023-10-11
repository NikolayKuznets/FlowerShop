//
//  NUser.swift
//  FlowerShop
//
//  Created by Ник К on 09.10.2023.
//

import Foundation

struct NUser: Identifiable {
    
    var id: String
    var name: String
    var phone: Int
    var adress: String
  
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["adress"] = self.adress
        
        return repres
    }
}
