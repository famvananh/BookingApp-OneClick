//
//  DetailsRestaurant.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct DetailsRestaurant: View {
  //  @Binding var showsecondView: Bool
    let id:String
    var name :String
    let type:String
    let rating :String
    let capacity:String
  //  var phone:String
    let adressFull:String
     var imageUrl:URL
    @State private var showingSheet = false
    
    var body: some View {
        ScrollView(.vertical){
            
        VStack(alignment: .center ){
            InfoView(id: id, name: name,type: type , rating: rating ,capacity: capacity, imageUrl: imageUrl)
            LocationsView(adressFull: self.adressFull)
            InfoRestaurantView()
            Button(action: {
                 print("69")
                self.showingSheet.toggle()
            }) {
                Text("Book a table")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 226, height: 48)
                    .background(Color.blue)
                    .cornerRadius(Constants.Styles.largeCornerRadius)
                
            }.sheet(isPresented: $showingSheet){
                BookingView(id:id, showsecondView: $showingSheet)
            }
            Spacer()
        }
        .foregroundColor(Color.black)
        }
    }
}

//struct DetailsRestaurant_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsRestaurant(showsecondView: <#Bool#>, name: <#String#>, type: <#String#>, rating: <#String#>, capacity: <#String#>, phone: <#String#>, adressFull: <#String#>)
//    }
//}
