//
//  OrderViewModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 4.05.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation

class OrdersManager: ObservableObject {
    func getDatas(completion: @escaping (Result<OrdersModel, Error>) -> Void) {
        let preferences = UserDefaults.standard
        guard let url = URL(string: "http://dev2.cogniteq.com:3110/api/orders"), let token = preferences.value(forKey: "accessToken") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if let error = error {
                completion(.failure(error))
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
                let jsonData = try decoder.decode(OrdersModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                    print(jsonData)
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
}
class OrderViewModel : ObservableObject, Identifiable {
    
    private var networkService = OrdersManager()
    
    @Published var orders : [Order]=[]
    
        func fetchOrderssData(completion: @escaping ([Order]) -> ()){
        networkService.getDatas { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let listOf):
                    self?.orders = listOf.orders
                case .failure(let error):
                    print("Error processing json data: \(error)")
                }
            }
        }
    }
}
