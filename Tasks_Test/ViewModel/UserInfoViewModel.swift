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
        APIManager.sharedInstance.fetchDataFromAPI(for: [UserModels].self, url: dataUrls.userInfoUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.usersArr = dataObtained
                //print(self.usersArr)
                complete()
            }
        }
    }
}
