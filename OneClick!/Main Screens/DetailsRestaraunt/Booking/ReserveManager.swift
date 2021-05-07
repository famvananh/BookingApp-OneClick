//
//  ReserveManager.swift
//  OneClick!
//
//  Created by Fam Van Anh on 3.05.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation

struct Sending: Codable {
    var date: String
    var people: String
    var staying: String
    var time: String
}

class ReserveManager {
    func sendingOrder(id:String,date:String,people:String,staying:String,time:String){
        let preferences = UserDefaults.standard
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/places/\(id)/reserve"), let token = preferences.value(forKey: "accessToken") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let post = Sending(date: date, people: people, staying: staying, time: time)
        
        let jsonData = try! JSONEncoder().encode(post)
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if let error = error {
                     print("Error took place \(error)")
                     return
                 }
                 guard let data = data else {return}
                 do{
                     let orders = try JSONDecoder().decode(OrderModel.self, from: data)
                     print("Response data:\n \(orders)")
                    
                 }catch let jsonErr{
                     print(jsonErr)
                }
            
        }.resume()
    }
}
