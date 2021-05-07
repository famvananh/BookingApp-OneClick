////
////  RestaurantService.swift
////  OneClick!
////
////  Created by Fam Van Anh on 16.04.21.
////  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
import Combine

class RestaurantViewModel : ObservableObject {
    private var networkService = NetworkManager()
    @Published var restaurants = [Restaurant]()
    
    func fetchRestaurantsData(completion: @escaping ([Restaurant]) -> ()){
        networkService.getDatas { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let listOf):
                    self?.restaurants = listOf.restaurants
                case .failure(let error):
                    print("Error processing json data: \(error)")
                }
            }
        }
    }
    
}
