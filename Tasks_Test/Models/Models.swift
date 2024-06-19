//
//  Models.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import Foundation

//MARK: Users Url model

struct UserModels: Codable {
    let name: String
    let email: String
    let phone: String
    let company: Company?
    let address: Address?
}
struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
struct Address: Codable {
    let city: String
}


//MARK: Luke's Url model

struct People: Codable {
    let name: String
    let height: String
    let birth_year: String
    let gender: String
    let created: String
}

//MARK: Movie Url model

struct Movies: Codable {
    let title : String
    let created_at: String
    let transcodings: [Transcodings]
}
struct Transcodings: Codable {
    let id : String
    let title : String
    let height: Int
}

//MARK: News Url model

struct NewsInfo: Codable {
    let articles : [Artcle]
}

struct Artcle: Codable {
    let author : String
    let description : String
   // let urlToImage : String
    let publishedAt : String
}

//MARK: Menu Url model

struct Menu: Codable {
    let meals : [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
}
