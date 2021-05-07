//
//  ImageUserView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 5.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct ImageUserView: View {
    var body: some View {
        ZStack{
            Image("bgUser")
                .resizable()
                .frame(height: 268)
            VStack(alignment: .center, spacing: 22){
                Image("demo")
                    .frame(width: 86, height: 86)
                    .clipShape(Circle())
                    .frame(width: 88, height: 88)
                    .overlay(Circle().stroke(Color.white,lineWidth:3).shadow(radius: 10))
                VStack(alignment: .center, spacing: 4){
                    Text("Fam Van Anh")
                        .font(.title)
                        .frame(height: 28)
                    
                    Text("famvananh0603@gmail.com")
                    
                    
                }.foregroundColor(.white)
            }.padding(.top)
            
        }
    }
}

struct ImageUserView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUserView()
    }
}
