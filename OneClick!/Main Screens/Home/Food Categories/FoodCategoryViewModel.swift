//
//  FoodCategoryViewModel.swift
//  OneClick!
//
//  Created by Fam Van Anh on 23.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import Foundation
import Combine

class FoodCategoryViewModel : ObservableObject, Identifiable {
    
    private var networkService = CategoryManager()
    
    @Published var category : [Category]=[]
    
        func fetchCategoriesData(completion: @escaping ([Category]) -> ()){
        networkService.getDatas { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let listOf):
                    self?.category = listOf.categories
                case .failure(let error):
                    print("Error processing json data: \(error)")
                }
            }
        }
    }
}
