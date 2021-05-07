//
//  LoginViewModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 31.03.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    
    
    let viewRouter:ViewRouter!
    let preferences  = UserDefaults.standard
    var getData = HttpApi()
    
    init(router:ViewRouter) {
        self.viewRouter = router
    }
    
    @Published var email = String() {
        didSet {
            self.changeLoginButtonState()
        }
    }
    
    @Published var userPass = String() {
        didSet{
            self.changeLoginButtonState()
        }
    }
    
    @Published var isLoginEnable = false
    @Published var isLoginAlertShown = false
    
    private func changeLoginButtonState(){
        if (email.count > 0 && userPass.count > 0) {
            self.isLoginEnable = true
        }
        else{
            self.isLoginEnable = false
        }
    }
    
    func validateLoginButton() {
        
        if (preferences.object(forKey: "accessToken") != nil) {
            

            self.viewRouter.currentPageId = .home
            
        }else{
            self.isLoginEnable = false
            self.isLoginAlertShown = true
            

        }
        
        
    }
    
    
    
}

