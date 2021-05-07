//
//  RecipeCardF.swift
//  OneClick!
//
//  Created by Fam Van Anh on 3.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct RecipeCardF: View {
    var image = ""
    @ObservedObject var categoryState = FoodCategoryViewModel()
    var body: some View {
        HStack{
            ForEach(categoryState.category, id:\.self) { category in
                Button (action: {
                    print("asd")
                    
                }){
                    VStack(alignment: .center, spacing: 8){
                        ZStack{
                            
                            Image("demo")
                                .cornerRadius(16.0)
                                .background(Color.init("3B7EFF"))
                                .frame(width: 109,height: 109)
                                .clipShape(Circle())
                            Image(systemName: "placeholder image")
                                .data(url: URL(string: "http://dev2.cogniteq.com:3110/" + category.imageUrl)!)
                                .renderingMode(.original)
                                .frame(width: 44,height: 44)
                        }
                        VStack(spacing:2) {
                            
                            Text(category.name).font(.headline)
                        }.foregroundColor(.black)
                        
                    }
                }
            }
            
        }.onAppear(){
            self.categoryState.fetchCategoriesData(){ (Category) in
                self.categoryState.category = Category
            }
        }
    }
}


struct RecipeCardF_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardF()
    }
}

