//
//  ProductCell.swift
//  FlowerShop
//
//  Created by Ник К on 05.10.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
   @State var uiImage = UIImage(named: "Bouqet1")
    
    var body: some View {

        VStack(spacing: 2) {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNex-regular", size: 14))
                Spacer()
                Text("\(product.price) ₽")
                    .font(.custom("AvenirNex-bold", size: 14))
                    
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        } .frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .shadow(radius: 4)
            .onAppear{
                StorageService.shared.downLoadProductImage(id: self.product.id) { result in
                    switch result {
                        
                    case .success(let data):
                        if let img = UIImage(data: data) {
                            self.uiImage = img
                            
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "Пионы", imageURL: "Not found",
                                     price: 3000,
                                     descript: "Букет из 11 больших пионов"))
    }
}
