//
//  ContentView.swift
//  FlowerShop
//
//  Created by Ник К on 05.10.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2)
                .background(Color("roseAlpha"))
                .cornerRadius(isAuth ? 30 : 60)
            
            VStack {
                TextField("Введите E-mail", text: $email)
                    .padding()
                    .background(Color("roseAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color("roseAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Повторите пароль", text: $confirmPassword)
                        .padding()
                        .background(Color("roseAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Авторизация пользователя, через FireBase")
                        AuthService.shared.signIn(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                                
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                                isShowAlert.toggle()
                            }
                        }

                    } else {
                        print("Регистрация пользователя")
                        
                        guard password == confirmPassword else {
                            self.alertMessage = "Пароли не совпадают!"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                                
                            case .success(let user):
                                alertMessage = "Вы зарегистрировались с e-mail \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                                
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                        
                        
                        
                        
                    }

                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт!")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors:[Color("redAlpha"), Color("roseAlpha")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3)
                        .foregroundColor(.black)

                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Еще не с нами?" : "Уже есть аккаунт!")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3)
                        .foregroundColor(Color(.purple))
                    

                }

            }
            .padding()
            .padding(.top, 16)
            .background(Color("lightRoseAlpha"))
            .cornerRadius(24)
            .padding(isAuth ? 30 : 12)
            .alert(alertMessage,
                   isPresented: $isShowAlert) {
                Button { } label: {
                    Text("Ok")
                }
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg")
            .ignoresSafeArea()
            .blur(radius: isAuth ? 0 : 6)
                    )
        .animation(Animation.easeIn(duration: 0.3), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            
            if AuthService.shared.currentUser?.uid == "uR9qTosQ6pR87uH2AkdqNMb6iJA2" {
                AdminOrdersView()
            } else { let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                
                MainTabBar(viewModel: mainTabBarViewModel)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
