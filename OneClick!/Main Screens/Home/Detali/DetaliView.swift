//
//  DetaliView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct DetaliView: View {
    var message: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("\(message)")
            Button("Press to dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }
    }
}


struct DetaliView_Previews: PreviewProvider {
    static var previews: some View {
        DetaliView(message: "123")
    }
}
