//
//  MovieViewModel.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import Foundation
import UIKit

class MovieViewModel {
    var movieArr :[Movies] = []
    func fetchData(complete: @escaping ()->()) {
        APIManager.sharedInstance.fetchDataFromAPI(for: [Movies].self, url: dataUrls.movieUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.movieArr = dataObtained
                complete()
            }
        }
    }
}
