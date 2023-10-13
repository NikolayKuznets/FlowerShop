//
//  ProductDetailViewModel.swift
//  FlowerShop
//
//  Created by Ник К on 06.10.2023.
//

import Foundation
import UIKit

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["Маленький", "Средний", "Большой"]
    @Published var count = 0
    @Published var image = UIImage(named: "Bouqet1")!
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "Маленький": return product.price
        case "Средний": return Int(Double(product.price) * 1.5)
        case "Большой": return Int(Double(product.price) * 2.5)
        default: return 0
        }
    }
    
    func getImage () {
        StorageService.shared.downLoadProductImage(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
