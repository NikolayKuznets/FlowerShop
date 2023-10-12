//
//  AuthService.swift
//  FlowerShop
//
//  Created by Ник К on 09.10.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    private init() { }
    
    private let auth = Auth.auth()
    
    var currentUser: User? {
        return auth.currentUser
    }
    
    func signUp(email: String,
                password: String,
                completion: @escaping (Result<User, Error>) -> ()) {
        
        auth.createUser(withEmail: email,
                        password: password) { result, error in
            if let result = result {
                let nUser = NUser(id: result.user.uid,
                                  name: "",
                                  phone: 0,
                                  adress: "")
                
                DatabaseService.shared.setProfile(user: nUser) { resultDB in
                    switch resultDB {
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }

            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signOut() {
        try! auth.signOut()
    }
    
    func signIn(email: String,
                password: String,
                completion: @escaping (Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
