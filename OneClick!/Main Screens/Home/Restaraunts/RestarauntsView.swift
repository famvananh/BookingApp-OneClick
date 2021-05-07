//
//  restauView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 19.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct RestarauntsView: View {
    @State private var showingSheet = false
    @State private var selected: Restaurant?
    @State private var selectedItems = [Restaurant]()
    @ObservedObject var restaurantState = RestaurantViewModel()
    @State var addFavourity = FavouritesManager()
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack {
                ForEach(restaurantState.restaurants, id:\.self) { restaurant in
                    VStack(alignment: .leading, spacing: 8){
                        ZStack{
                            
                            Image(systemName: "placeholder image")
                                .data(url: URL(string: "http://dev2.cogniteq.com:3110/" + restaurant.imageUrl)!)
                                .frame(width: 226,height: 136)
                                .cornerRadius(16.0)
                            Image(systemName: "heart.fill")
                                .frame(width: 26, height: 26)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    if restaurant.favourite == true{
                                        self.addFavourity.add(id: String(restaurant.id))
                                    }
                                }
                        }
                        VStack(alignment: .leading,spacing:2) {
                            Text(restaurant.name).font(.headline)
                            HStack(alignment: .center){
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                                Text(String(restaurant.rating))
                                    .font(.subheadline)
                                Text(String(restaurant.capacity)).foregroundColor(Color.black.opacity(0.7))
                                    .font(.subheadline)
                            }
                        }.foregroundColor(.black)
                    }
                    .onTapGesture {
                        self.selected = restaurant
                        self.showingSheet = true
                        print(restaurant)
                    }
                }
            }
        }.onAppear{
            self.restaurantState.fetchRestaurantsData(){ (Restaurant) in
                self.restaurantState.restaurants = Restaurant
            }
        }
        .sheet(item: self.$selected, content: { rest in
            DetailsRestaurant(id: String(rest.id), name: rest.name,type:rest.type,rating: String(rest.rating),capacity: String(rest.capacity),adressFull:rest.addressFull,imageUrl:URL(string: "http://dev2.cogniteq.com:3110/" + rest.imageUrl)!).transition(.move(edge: .leading))
            
        })
    }
}

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
