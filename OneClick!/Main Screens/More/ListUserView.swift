//
//  ListUserView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 5.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct ListUserView: View {
    @State private var showSecondView = false
    var message = "Hello from ContentView"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Button(action: {
                self.showSecondView.toggle()
            }){ HStack {
                Image(systemName: "star")
                .frame(width: 23, height: 24)
                Text("Account details")
            }
                
            .foregroundColor(.black)
            }.sheet(isPresented: $showSecondView){
                DetaliView(message: self.message)
            }
           
            HStack{
                Image(systemName: "star")
                    .frame(width: 23, height: 24)
                Text("Booking history")
            }
           
            HStack{
                Image(systemName: "star")
                    .frame(width: 23, height: 24)
                Text("Favorites")
            }
          
            HStack{
                Image(systemName: "star")
                    .frame(width: 23, height: 24)
                Text("Notifications")
            }
            
            HStack{
                Image(systemName: "star")
                    .frame(width: 23, height: 24)
                Text("Setting")
            }
            Divider()
        }.padding(.leading)
    }
}

struct ListUserView_Previews: PreviewProvider {
    static var previews: some View {
        ListUserView()
    }
}
