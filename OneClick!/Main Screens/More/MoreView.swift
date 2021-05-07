//
//  MoreView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 5.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        VStack(alignment: .leading ){
            ScrollView{
                ImageUserView()
                VStack{
                    ListUserView()
                }.frame(width: 375, height: 240)
                
                VStack{
                    ListSupportView()
                }.frame(width: 375, height: 192)
                
                Button("LOG OUT") {
                    print("CHAO!")
                }
                
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
