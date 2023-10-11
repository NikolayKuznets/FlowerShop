//
//  AdminOrdersView.swift
//  FlowerShop
//
//  Created by Ник К on 11.10.2023.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    
    var body: some View {
        Text("Hello, Admin!")
            .background(Color.mint)
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
