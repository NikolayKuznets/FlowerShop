//
//  MainTabBarViewModel.swift
//  FlowerShop
//
//  Created by Ник К on 09.10.2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
