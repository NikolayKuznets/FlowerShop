//
//  CatalogViewModel.swift
//  FlowerShop
//
//  Created by Ник К on 05.10.2023.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product( id: "1",
                 title: "Розы", imageURL: "Not found",
                 price: 3000,
                 descript: "Букет из 25 роз"),
        Product( id: "2",
                 title: "Пионы", imageURL: "Not found",
                 price: 5000,
                 descript: "Букет из 11 больших пионов"),
        Product( id: "3",
                 title: "Лилии", imageURL: "Not found",
                 price: 3500,
                 descript: "Букет из 6 больших лилий"),
        Product( id: "4",
                 title: "Подсолнухи", imageURL: "Not found",
                 price: 3000,
                 descript: "Букет из 5 больших подсолнухов"),
        Product( id: "5",
                 title: "Ромашки", imageURL: "Not found",
                 price: 4500,
                 descript: "Букет из 111 больших пионов")
    ]
    
   @Published var flowers = [
        Product( id: "6",
                 title: "Лилии", imageURL: "Not found",
                 price: 3500,
                 descript: "Букет из 6 больших лилий"),
        Product( id: "7",
                 title: "Подсолнухи", imageURL: "Not found",
                 price: 3000,
                 descript: "Букет из 5 больших подсолнухов"),
        Product( id: "8",
                 title: "Ромашки", imageURL: "Not found",
                 price: 4500,
                 descript: "Букет из 111 больших пионов"),
        Product( id: "9",
                 title: "Ромашки", imageURL: "Not found",
                 price: 4500,
                 descript: "Букет из 111 больших пионов"),
        Product( id: "10",
                 title: "Ромашки", imageURL: "Not found",
                 price: 4500,
                 descript: "Букет из 111 больших пионов")
    ]
    
    func getProducts() {
        DatabaseService.shared.gerProducts { result in
            switch result {
                
            case .success(let products):
                self.flowers = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
