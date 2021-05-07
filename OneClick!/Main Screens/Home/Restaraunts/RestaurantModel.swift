//
//  RestaurantsModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 16.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation

struct RestaurantModel: Decodable {
    let restaurants:[Restaurant]
    
    private enum CodingKeys: String, CodingKey {
        case restaurants = "data"
    }
}

struct Restaurant: Decodable,Hashable,Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let rating :Float
    let addressFull :String
    let addressLat :Float
    let addressLon :Float
    //  let phone :String
    let description :String
    let capacity :Int
    let tablePrice :String
    let favourite :Bool
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image_url"
        case type = "type"
        case rating = "rating"
        case addressFull = "address_full"
        case addressLat = "address_lat"
        case addressLon = "address_lon"
      //  case phone = "phone"
        case description = "description"
        case capacity = "capacity"
        case tablePrice = "table_price"
        case favourite = "favourite"
        
    }
}



