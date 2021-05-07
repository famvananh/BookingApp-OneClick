//
//  BookingManager.swift
//  OneClick!
//
//  Created by Fam Van Anh on 23.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
class BookingManager {
    @Published var time :[String] = []
    func getTimeData(id:String) {
        
        let preferences = UserDefaults.standard
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/places/\(id)/reservation"), let token = preferences.value(forKey: "accessToken") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if let error = error {
               
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                
                print("Empty Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([String].self, from: data)
                DispatchQueue.main.async {
                    self.time = jsonData
                    print(jsonData)
                }
        
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
}
