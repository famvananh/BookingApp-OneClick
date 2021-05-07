//
//  ListSupportView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct ListSupportView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            Text("About")
            Text("Contact")
            Text("Terms")
            Text("Privacy Policy")
        }.frame(width: 375, height: 192)
    }
}

struct ListSupportView_Previews: PreviewProvider {
    static var previews: some View {
        ListSupportView()
    }
}
