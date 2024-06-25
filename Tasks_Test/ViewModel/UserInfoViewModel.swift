//
//  UserInfoViewModel.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import Foundation
import UIKit

class UserInfoViewModel {
    var usersArr: [UserModels] = []
    func fetchData(complete: @escaping ()->()) {
        //APIManager.sharedInstance.fetchDataFromAPI(for: [UserModels].self, url: dataUrls.userInfoUrl.rawValue) { data, error in
        MockAPIManager.mockObj.fetchDataFromAPI(for: [UserModels].self, url: dataUrls.userInfoUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.usersArr = dataObtained
                print(self.usersArr)
                complete()
            }
        }
    }
}
 
//class UserViewModel {
//    func fetchedData(url: String) async throws -> [UserModels]{
//        //let output = try await APIClient.sharedInstance.fetchData(for: [UserModels].self, url: url) ?? []
//        print(output.count)
//        return output
//    }
//}
