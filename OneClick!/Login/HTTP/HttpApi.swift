//
//  HttpApi.swift
//  OneClick!
//
//  Created by Fam Van Anh on 11.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
import Combine


class HttpApi : ObservableObject {
    //    var didChange = PassthroughSubject<HttpApi, Never>()
    //    var authenticated = false
    //    {
    //        didSet{
    //            didChange.send(self)
    //        }
    //    }
    
    func getMethod(email:String,password:String) {
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/login") else {
            print("Error: cannot create URL")
            return
        }
        
        let body:[String:String]=["email":email,"password":password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
                
            } else {
                return
                
            }
            print(data)
            do {
                
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    
                    print("Error: Cannot convert data to JSON object")
                    
                    return
                }
                print(jsonObject)
                DispatchQueue.main.async {
                    
                    if let accessToken = jsonObject["access_token"] as? String{
                        let preferences = UserDefaults.standard
                        preferences.set(accessToken, forKey: "accessToken")
                     //   print(accessToken)
                    }
                }
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
            
        }.resume()
    }
}

