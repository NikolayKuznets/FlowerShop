//
//  ProductDetailView.swift
//  FlowerShop
//
//  Created by Ник К on 06.10.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel
    @State var size = "Маленький"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                
                Image(uiImage: self.viewModel.image)
                        .resizable()
//                        .aspectRatio(contentMode: .fill)
                        .scaledToFit()
                        .frame(maxWidth: 300, maxHeight: 300)
                        .clipped()
                        .cornerRadius(20)
                
                HStack {
                    Text("\(viewModel.product.title)")
                        .font(.title2)
                        Spacer()
                    Text("\(viewModel.getPrice(size: self.size)) ₽")
                        .font(.title2)
                } .padding()

                Text("\(viewModel.product.descript)")
                    .padding()
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...100)
                    Text("\(self.count)")
                        .padding(.leading, 24)
                } .padding(.horizontal)
                
                Picker("Размер букета", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                    
                }.pickerStyle(.segmented)
                    .padding()
            
            }
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                
                position.product.price = viewModel.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Text("В корзину")
                    .padding()
                    .padding(.horizontal, 60)
                    
                    .foregroundColor(.black)
                    .background(LinearGradient(colors:[Color("redAlpha"), Color("roseAlpha")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    .font(.title2)
            }
            .onAppear{
                self.viewModel.getImage()
            }
            Spacer()
        }

    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(
            id: "1",
            title: "Пионы",
            imageURL: "Not found",
            price: 1500,
            descript: "Большой букет пионов")))
    }
}
