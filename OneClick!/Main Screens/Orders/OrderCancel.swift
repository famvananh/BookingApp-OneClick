//
//  OrderCanncel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 5.05.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
struct Message:Decodable ,Hashable {
    let message:String
    private enum CodingKeys: String, CodingKey {
        case message = "message"
    }
    
}

class OrderCancel {
    func cancelOrder(id:String){
        let preferences = UserDefaults.standard
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/orders/\(id)"), let token = preferences.value(forKey: "accessToken") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
     
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if let error = error {
                     print("Error took place \(error)")
                     return
                 }
                 guard let data = data else {return}
                 do{
                     let orders = try JSONDecoder().decode(Message.self, from: data)
                     print("Response data:\n \(orders)")
                    
                 }catch let jsonErr{
                     print(jsonErr)
                }
            
        }.resume()
    }
}
