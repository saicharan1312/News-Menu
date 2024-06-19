//
//  NewsViewModel.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import Foundation
import UIKit

class NewsViewModel {
    var newsArr: [Artcle] = []
    func fetchData(complete: @escaping ()->()) {
        APIManager.sharedInstance.fetchDataFromAPI(for: NewsInfo.self, url: dataUrls.newsUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.newsArr = dataObtained.articles
                print(self.newsArr)
                complete()
            }
        }
    }
}
