//
//  ContentView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 30.03.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State var getData = HttpApi()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center,spacing: 10){
                
                
                UserNameField(userNameString: $loginViewModel.email)
                PasswordField(passwordString: $loginViewModel.userPass)
                
                VStack(alignment: .center, spacing: 16){
                    VStack(alignment: .center, spacing: 24){
                        LoginButton(loginViewModel: loginViewModel)
                        Text("Don't have an account? Sign up")
                            .font(.footnote)
                            
                            .frame(height: 18, alignment: .center)
                        
                    }
                }.padding(.bottom,45)
                
            } .padding()
            
            
            
            
        }.background(Image("bg-1").resizable()
            .aspectRatio(contentMode: .fill)
            
        ).edgesIgnoringSafeArea(.all)
            .onAppear(perform: self.loginViewModel.validateLoginButton)
        
        
        
    }
}
struct UserNameField:View {
    var userNameString:Binding<String>
    var body:some View {
        VStack(alignment: .leading, spacing: 4){
            Text("Email")
                .frame(height: 18)
                .font(.footnote)
            
            
            TextField("", text: userNameString)
                .frame(height: 48, alignment: .center)
                .background(Constants.Colors.textField)
                .cornerRadius(Constants.Styles.smallCornerRadius)
            //            .padding(.top, Constants.Styles.topPadding545)
        }
        
    }
}
struct PasswordField:View {
    var passwordString:Binding<String>
    var body:some View {
        VStack(alignment: .leading, spacing: 4){
            Text("Password")
                .frame(height: 18)
                .font(.footnote)
            ZStack(alignment: .trailing){
                
                SecureField("", text: passwordString)
                    .frame(height: 48, alignment: .center)
                    .background(Constants.Colors.textField)
                    .cornerRadius(Constants.Styles.smallCornerRadius)
                
                Image(systemName: "eye.slash.fill")
                    .padding(.trailing, 14)
            }
        }
        
    }
}




struct LoginButton:View{
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body:some View {
        
        Button(action: {
            
           
            self.loginViewModel.getData.getMethod(email: self.loginViewModel.email, password: self.loginViewModel.userPass)
            self.loginViewModel.validateLoginButton()
          
            
        }) {
            Text("Sign in")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 226, height: 48)
                .background(loginViewModel.isLoginEnable ? Constants.Colors.buttonLogin  : Constants.Colors.darkGray)
                .cornerRadius(Constants.Styles.largeCornerRadius)
        }
        .alert(isPresented: $loginViewModel.isLoginAlertShown) {
            Alert(title: Text("Invalid Credentails !!"), message: Text("Please login with valid username or password"), dismissButton: .default(Text("OK")))
        }
        .disabled(!loginViewModel.isLoginEnable)
        
    }
    
}
struct Constants {
    
    struct Colors {
        static let textField = Color("F6F6F6")
        static let darkGray = Color(red: 169.0/255.0, green: 169.0/255.0, blue: 169.0/255.0, opacity: 1.0)
        static let buttonLogin = Color("3C7EFF")
        
    }
    
    struct Styles {
        static let smallCornerRadius:CGFloat = 8.0
        static let largeCornerRadius:CGFloat = 50.0
        static let topPadding545:CGFloat = 244
        static let bottomPadding32:CGFloat = 32
        static let bottomPadding16:CGFloat = 16
        static let pagePadding24:CGFloat = 24.0
    }
    
}

struct Config {
    
    static let testUserName = "user123"
    static let testPassword = "user123"
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LoginView(loginViewModel:  LoginViewModel(router: ViewRouter()))
            LoginView(loginViewModel:  LoginViewModel(router: ViewRouter())).previewDevice("iPhone 8")
            
        }
    }
}
