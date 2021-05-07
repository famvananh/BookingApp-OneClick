//
//  LocationsView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @State private var showSecondView = false
    var adressFull:String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "map")
                    .resizable()
                    .frame(width: 20, height: 24)
                HStack (spacing: 36) {
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(adressFull)")
                        Button(action: {
                            self.showSecondView.toggle()
                        }){ HStack {
                            Text(" View map")
                        }.sheet(isPresented: $showSecondView){
                            MapViewDetail()
                        }
                        }
                    }
                    MapView()
                        .frame(width: 88, height: 88).padding()
                    
                    
                    
                }
            }
        }.padding()
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(adressFull: "Belarus,Hrodno region,Hrodno,st. Dubko 17!")
    }
}
