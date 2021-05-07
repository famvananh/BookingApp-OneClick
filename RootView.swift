//
//  RootView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 31.03.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
import SwiftUI

struct RootView: View {
   
        @ObservedObject var viewRouter: ViewRouter
        var body: some View {
            VStack {
                if viewRouter.currentPageId == .login {
                    LoginView(loginViewModel: LoginViewModel(router:viewRouter))
                   // RegistrationView(loginViewModel: LoginViewModel(router:viewRouter))
                } else if viewRouter.currentPageId == .home {
                    NavigationBar()
                    
                }
            }
            
        }
    }


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewRouter: ViewRouter())
    }
}

