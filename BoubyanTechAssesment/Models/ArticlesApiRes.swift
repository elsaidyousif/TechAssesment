//
//  ArticlesApiRes.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 01/02/2022.
//

import Foundation
//Articel api response model to serialize response data
struct ArticlesApiRes: Decodable {
    let status: String?
    let num_results: Int?
    let results: [ArticleItem]?
}

struct ArticleItem: Decodable {
    let id: Int?
    let source: String?
    let published_date: String?
    let byline: String?
    let title: String?
    let abstract: String?
    let media: [mediaItem]?
}

struct mediaItem : Decodable {
    let media_metadata: [urlItem]?
    private enum CodingKeys : String, CodingKey {
        case media_metadata = "media-metadata"
    }
}

struct urlItem: Decodable {
    let url: String?
}
