//
//  HomeView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 1.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
       
        VStack{
            VStack{
                HStack(alignment: .center){
                    Image(systemName: "location.fill")

                    VStack(alignment: .leading){
                        Text("Location")
                            .font(.footnote)
                            .frame(width: 52, height: 18)
                        Button("Current location") {
                            print("Current location")
                            let preferences = UserDefaults.standard
                            preferences.removeObject(forKey: "accessToken")
                        }.font(.headline)
                        .foregroundColor(.black)
                        Spacer()
                    }.padding(.trailing , 167)
                    Image(systemName: "magnifyingglass")
                }.frame(width: 375, height: 48)
            }
            ScrollView (showsIndicators: false) {
                VStack (alignment: .leading, spacing: 16){
                    VStack(alignment: .leading, spacing: 2){
                        HStack(alignment: .center){
                            Text("My Favorite Restaraunts")
                                .font(.system(size: 21, weight: .light, design: .default))
                                .fontWeight(.bold)
                                .frame(width: 242, height: 28)
                                .font(.title)
                            Button(action: {
                                 print("69")
                                
                            }) {
                               Image(systemName: "chevron.right")
                                
                            }.padding(.leading,70)
                        }
                        FavouritesView()
                    }
                    VStack(alignment: .leading, spacing: 16){
                        HStack(alignment: .center){
                            Text("Restaraunts")
                                .font(.system(size: 21, weight: .light, design: .default))
                                .fontWeight(.bold)
                                .frame(width: 121, height: 28)
                                .font(.title)
                            Button(action: {
                                 print("69")
                                
                            }) {
                               Image(systemName: "chevron.right")
                                
                            }.padding(.leading,190)
                        }

                        RestarauntsView()


                    }
                    VStack(alignment: .leading, spacing: 16){
                        HStack(alignment: .center){
                            Text("Food Categories")
                                .font(.system(size: 21, weight: .light, design: .default))
                                .fontWeight(.bold)
                                .frame(width: 165, height: 28)
                                .font(.title)
                            Button(action: {
                                 print("69")
                                
                            }) {
                               Image(systemName: "chevron.right")
                                
                            }.padding(.leading,146)
                        }
                        FoodCategoriesView()

                    }
                }
                .padding(.leading)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
