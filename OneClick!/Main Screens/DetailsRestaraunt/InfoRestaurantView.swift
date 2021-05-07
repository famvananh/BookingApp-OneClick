//
//  InfoRestaurantView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct InfoRestaurantView: View {
    @State private var showSecondView = false
  //  var phone:String
    var message = "Hello from ContentView"
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "phone")
                        .resizable()
                        .frame(width: 22, height: 24)
                  //  Text("\(phone)")
                }
                HStack(spacing: 10){
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 24, height: 24)
                    HStack (spacing: 36) {
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("Avalible until 12:00 PM")
                            Button(action: {
                                self.showSecondView.toggle()
                            }){ HStack {
                                Text("View schedule")
                                    .foregroundColor(.blue)
                            }.sheet(isPresented: $showSecondView){
                                DetaliView(message: self.message)
                            }
                            }
                        }
                    }
                }
                HStack {
                    Image(systemName: "book")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Jesus, the Shawarma of God !! GO mum GOJesus, the Shawarma of God !! GO mum GOJesus, the Shawarma of God !! GO mum GO")
                }
            }
        }.padding()
    }
}

struct InfoRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRestaurantView()
    }
}
