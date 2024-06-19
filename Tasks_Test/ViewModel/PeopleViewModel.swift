//
//  PeopleViewModel.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import Foundation
import UIKit

class PeopleViewModel {
    var peopleData: People?
    func fetchData(complete: @escaping ()->()) {
        APIManager.sharedInstance.fetchDataFromAPI(for: People.self, url: dataUrls.peopleUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.peopleData = dataObtained
                //print(self.peopleArr)
                complete()
            }
        }
    }
}
