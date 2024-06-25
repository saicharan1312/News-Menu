//
//  MockAPIManager.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/24/24.
//

import Foundation
class MockAPIManager : APIManager {
    
    static let mockObj = MockAPIManager()
    
    override func fetchDataFromAPI<T: Codable>(for: T.Type, url: String, completion:  @escaping (T?,Error?)->()) {
        if url == dataUrls.userInfoUrl.rawValue {
            let userMockObj = UserModels(name: "Sai", email: "sai@gmail.com", phone: "123456", company: Company(name: "Apple", catchPhrase: "1", bs: "2"), address: Address(city: "Washington DC"))
            if let user = [userMockObj] as? T {
                completion(user, nil)
            }
        }
        else if url == dataUrls.peopleUrl.rawValue {
            let peopleMockObj = People(name: "Sai", height: "123", birth_year: "2000", gender: "Male", created: "None")
            if let people = peopleMockObj as? T {
                completion(people, nil)
            }
        }
        else if url == dataUrls.movieUrl.rawValue {
            let movieMockObj = Movies(title: "RRR", created_at: "No created", transcodings: [Transcodings(id: "1", title: "Movie1", height: 23)])
            if let movieMock = [movieMockObj] as? T {
                completion(movieMock, nil)
            }
        }
        else if url == dataUrls.newsUrl.rawValue {
            let newsMockObj = NewsInfo(articles: [Article(source: Source(name: "India today"), title: "The Eco times", author: "Sai", description: "The...Day", urlToImage: "image", publishedAt: "21-06-2024")])
            if let newsMock = newsMockObj as? T {
                completion(newsMock, nil)
            }
        }
        else {
            let menuMockObj = Menu(meals: [Meal(strMeal: "Chocolate", strInstructions: "Biscuit", strMealThumb: "image")])
            if let menuMock = menuMockObj as? T {
                completion(menuMock, nil)
            }
        }
    }
}
