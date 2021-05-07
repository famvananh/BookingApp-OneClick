//
//  MapView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    func makeUIView(context: Context) -> MKMapView {
           MKMapView(frame: .zero)

      }
      func updateUIView(_ view: MKMapView, context: Context) {
              let coordinate = CLLocationCoordinate2D(
                  latitude:53.669353, longitude:23.813131)
        let span = MKCoordinateSpan(latitudeDelta:0.05, longitudeDelta: 0.05)
              let region = MKCoordinateRegion(center: coordinate, span: span)
              view.setRegion(region, animated: true)
      }
    
}
struct MapViewDetail: View {
   
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(){
            MapView()
            Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
            
        
            
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapViewDetail()
    }
}
