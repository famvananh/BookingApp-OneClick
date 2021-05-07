//
//  OrdersModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 5.05.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation

struct OrdersModel: Decodable {
    let orders:[Order]
    
    private enum CodingKeys: String, CodingKey {
        case orders = "data"
    }
}
struct Order :Decodable ,Hashable{
    let id: Int
    let status: String
    let price: String
    let date: String
    let people: Int
    let time :String
    let userId :Int
    let placeId :Int
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case price = "price"
        case date = "date"
        case people = "people"
        case time = "time"
        case userId = "user_id"
        case placeId = "place_id"
    }
}


