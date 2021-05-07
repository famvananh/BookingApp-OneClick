//
//  FoodCategoriesModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 23.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
struct FoodCategoryModel: Decodable {
    let categories: [Category]
    
    private enum CodingKeys: String, CodingKey {
        case categories = "data"
    }
}

struct Category: Decodable,Hashable {
    let id: Int
    let name: String
    let imageUrl: String
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image_url" 
    }
}
