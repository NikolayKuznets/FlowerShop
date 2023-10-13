//
//  AddProductView.swift
//  FlowerShop
//
//  Created by Ник К on 12.10.2023.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var shopImagePicker = false
    @State private var image = UIImage(named: "bg")!
    @State private var title: String = ""
    @State private var price: Int? = nil
    @State private var descript: String = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Text("Добавить товар")
                .font(.title2.bold())
                .padding(.top)
            Image(uiImage: image)
                .resizable()
                .cornerRadius(24)
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipped()

                .onTapGesture {
                    shopImagePicker.toggle()
                }

            
                TextField("Название продукта", text: $title)
                    .padding()
                TextField("Цена продукта", value: $price, format: .number)
                    .keyboardType(.numberPad)
                    .padding()
                TextField("Описание продукта", text: $descript)
                    .padding()
            
            Button {
                guard let price = price else {
                    print("Не возможно извлечь цену из TextField")
                    return
                }
                let product = Product(id: UUID().uuidString, title: title, price: price, descript: descript)
                guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                    case .success(let product):
                        print(product.title)
                        dismiss()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            } label: {
                Text("Сохранить")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }


        }
        .padding()
        .sheet(isPresented: $shopImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
