//
//  ViewRouter.swift
//  OneClick!
//
//  Created by Fam Van Anh on 31.03.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum PageId {
    case login
    case home
    case registration
    case detial
}

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPageId:PageId = .login {
        didSet {
             objectWillChange.send(self)
        }
    }
    
}
