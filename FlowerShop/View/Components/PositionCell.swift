//
//  PositionCell.swift
//  FlowerShop
//
//  Created by Ник К on 06.10.2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text("\(position.product.title)")
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        } .padding(.horizontal)

    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
            position: Position(id: UUID().uuidString,
                               product: Product(id: UUID().uuidString,
                                                title: "Пионы букет",
                                                imageURL: "Bouqet1",
                                                price: 1500,
                                                descript: "супер букет"),
                               count: 3))
    }
}
