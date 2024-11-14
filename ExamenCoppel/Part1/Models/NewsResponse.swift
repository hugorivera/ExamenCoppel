//
//  NewsResponse.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 11/11/24.
//

import Foundation

struct NewsResponse: Codable {
    let meta: Meta
    let data: [Datum]
}

struct Datum: Codable {
    let uuid, title, description, keywords: String
    let snippet: String
    let url: String
    let imageURL: String
    let language, publishedAt, source: String
    let categories: [String]
    let locale: String

    enum CodingKeys: String, CodingKey {
        case uuid, title, description, keywords, snippet, url
        case imageURL = "image_url"
        case language
        case publishedAt = "published_at"
        case source, categories
        case locale
    }
}

struct Meta: Codable {
    let found, returned, limit, page: Int
}
