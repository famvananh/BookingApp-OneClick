//
//  OrderModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 4.05.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
struct OrderModel :Decodable ,Hashable{
  
        let status: String
        let price: Int
        let date: String
        let people: String
        let time :String
        let staying :String
        let stayingEnd :String
        let userId :Int
        let placeId :String

        
        private enum CodingKeys: String, CodingKey {
            case status = "status"
            case price = "price"
            case date = "date"
            case people = "people"
            case time = "time"
            case staying = "staying"
            case stayingEnd = "staying_end"
            case userId = "user_id"
            case placeId = "place_id"
      
            
        }
    
}
