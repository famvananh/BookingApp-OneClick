//
//  InfoView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 7.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var id :String
    var name :String
    var type:String
    var rating :String
    var capacity:String
    var imageUrl:URL
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        let imageData = (try? Data(contentsOf: imageUrl))!
        let uiImage = UIImage(data: imageData)!
        
        VStack{
            VStack(alignment: .leading){
                ZStack{
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(height: 268)
                    HStack(alignment: .center, spacing: 300){
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 18, height: 18)
                            
                        }
                        Image(systemName: "heart")
                            .frame(width: 18, height: 18)
                    }.foregroundColor(.white)
                    .padding(.bottom,145)
                }
                Text("\(name)")
                    .font(.system(size: 28, weight: .light, design: .default))
                    .fontWeight(.bold)
                    .frame(height: 34)
                    .font(.title)
                    .padding(.leading,16)
                VStack(alignment: .leading,spacing:1){
                    Text("\(type)")
                    HStack{
                        Group{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }.foregroundColor(.yellow)
                        Text("\(rating)").bold()
                        Text("\(capacity)").opacity(15)
                        
                    }
                    
                }.padding(.leading,16)
                
                
            }
        }
    }
}

//struct InfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView(name: "name", type: "type", rating: "5", capacity: "69")
//    }
//}
