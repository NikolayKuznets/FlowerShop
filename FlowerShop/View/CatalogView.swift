//
//  Catalog.swift
//  FlowerShop
//
//  Created by Ник К on 05.10.2023.
//

import SwiftUI

struct CatalogView: View {
    
    let layoutForPopularsProducts = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForFlowers = [GridItem(.adaptive(minimum: screen.width / 2.8))]
    
    @StateObject var viewModel = CatalogViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            Section("Популярное") {
                 
                ScrollView (.horizontal, showsIndicators: false){
                    LazyHGrid(rows: layoutForPopularsProducts, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
//                        .clipped()
//                            .frame(height: 200)//
                    }
                    .padding(.bottom, 30)
                }
            }
            
            Section("Цветы") {
                 
                ScrollView (.vertical, showsIndicators: false){
                    LazyVGrid(columns: layoutForFlowers) {
                        ForEach(viewModel.flowers, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                                    
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                                .padding(.top, 70)
                        }

//                        .clipped()
//                        .frame(height: 200)//
//                            .scaledToFit()// тут можно писать модификаторы
                    }
                    .padding()
                }
            }
        }.navigationBarTitle(Text("Каталог"))
            .onAppear{
                print("getProducts")
                self.viewModel.getProducts()
            }
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
