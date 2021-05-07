//
//  RegistrationView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 1.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
     @ObservedObject var loginViewModel: LoginViewModel
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center,spacing: 10){
                
                UserNameFieldRG(userNameString: $loginViewModel.email)
                PasswordFieldRG(passwordString: $loginViewModel.userPass)
                PasswordFieldRepeat(passwordString: $loginViewModel.userPass)
                VStack(alignment: .center, spacing: 16){
                    VStack(alignment: .center, spacing: 24){
                        LoginButtonRG(loginViewModel: loginViewModel)
                        Text("Alredy have an account? Sign in")
                            .font(.footnote)
                            
                            .frame(height: 18, alignment: .center)
                        
                    }
                }.padding(.bottom,45)
            } .padding()
            
            
            
            
        }.background(Image("bg-2").resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all))
    }
}
struct UserNameFieldRG:View {
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
            
        }
        
    }
}
struct PasswordFieldRG:View {
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
struct PasswordFieldRepeat:View {
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




struct LoginButtonRG:View{
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body:some View {
        
        Button(action: {
            self.loginViewModel.validateLoginButton()
        }) {
            Text("Sign up")
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
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(loginViewModel:  LoginViewModel(router: ViewRouter()))
    }
}
