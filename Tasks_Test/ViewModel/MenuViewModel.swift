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
       // APIManager.sharedInstance.fetchDataFromAPI(for: Menu.self, url: dataUrls.menuUrl.rawValue) { data, error in
        MockAPIManager.mockObj.fetchDataFromAPI(for: Menu.self, url: dataUrls.menuUrl.rawValue) { data, error in
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



//class MenuViewModel {
//    func fetchedData(url: String) async throws -> [Meal] {
//        if let output = try await APIClient.sharedInstance.fetchData(for: Menu.self, url: url) {
//            return output.meals ?? []
//        }
//        return []
//    }
//}
