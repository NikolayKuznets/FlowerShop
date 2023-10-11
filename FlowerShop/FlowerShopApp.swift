//
//  FlowerShopApp.swift
//  FlowerShop
//
//  Created by Ник К on 05.10.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct FlowerShopApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser {
                if user.uid == "uR9qTosQ6pR87uH2AkdqNMb6iJA2" {
                    //пока что не работает, но я разбираюсь
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                     MainTabBar(viewModel: viewModel)
                }
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("appDelegate")
            
            return true
        }
    }
}
