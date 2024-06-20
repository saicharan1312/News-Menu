//
//  Network Manager.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import Foundation
import UIKit

class APIManager {
    static let sharedInstance = APIManager()
    private init() {}
    func fetchDataFromAPI<T: Codable>(for: T.Type, url: String, completion:  @escaping (T?,Error?)->()) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                print("Error Page Not Found")
                completion(nil,error)
            }
            if let serverData = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: serverData)
                    completion(decodedData, nil)
                }
                catch {
                    print("Error while decoding data")
                }
            }
        }.resume()
    }
    func getImageData(url: String, closure: @escaping (Data?) -> ()) {
            if let imageUrl = URL(string: url) {
                URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, _, _ in
                    if let imageData = data {
                        closure(imageData)
                    }
                }.resume()
            }
    }
}

