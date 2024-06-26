//
//  NewsViewModel.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import Foundation
import UIKit

class NewsViewModel {
    var newsArr: [Article] = []
    func fetchData(complete: @escaping ()->()) {
     //   APIManager.sharedInstance.fetchDataFromAPI(for: NewsInfo.self, url: dataUrls.newsUrl.rawValue) { data, error in
        MockAPIManager.mockObj.fetchDataFromAPI(for: NewsInfo.self, url: dataUrls.newsUrl.rawValue) { data, error in
            if error != nil {
                print("Error found")
                complete()
            }
            if let dataObtained = data {
                self.newsArr = dataObtained.articles ?? []
                print(self.newsArr )
                complete()
            }
        }
    }
}


//class NewsViewModel {
//    func fetchedData(url: String) async throws -> [Article] {
//        if let output = try await APIClient.sharedInstance.fetchData(for: NewsInfo.self, url: url) {
//            return output.articles ?? []
//        }
//        return []
//    }
//}
