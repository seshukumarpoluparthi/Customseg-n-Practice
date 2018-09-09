//
//  ModelNews.swift
//  EmpProfile
//
//  Created by apple on 8/21/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import Foundation
struct GetNews: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
struct Article: Codable {
  let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
}
struct Source: Codable {
   // let id: String?
    let name: String
}
