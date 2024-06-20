//
//  MenuViewModel.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import Foundation
import UIKit

class MenuViewModel {
    var menuArr: [Meal] = []
    func fetchData(complete: @escaping ()->()) {
        APIManager.sharedInstance.fetchDataFromAPI(for: Menu.self, url: dataUrls.menuUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.menuArr = dataObtained.meals ?? []
                print(self.menuArr.count )
                complete()
            }
        }
    }
}

