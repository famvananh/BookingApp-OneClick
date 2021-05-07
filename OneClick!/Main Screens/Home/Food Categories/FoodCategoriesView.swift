//
//  FoodCategoriesView.swift
//  OneClick!
//
//  Created by Fam Van Anh on 3.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct FoodCategoriesView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 8) {
                        ForEach(0..<1) { image in
                            RecipeCardF(image: "img\(image)")
                        }
                        
                    }
                }
            }
    }
}

struct FoodCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCategoriesView()
    }
}
