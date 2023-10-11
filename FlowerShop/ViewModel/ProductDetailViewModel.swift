//
//  ProductDetailViewModel.swift
//  FlowerShop
//
//  Created by Ник К on 06.10.2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["Маленький", "Средний", "Большой"]
    @Published var count = 0
    
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
}
