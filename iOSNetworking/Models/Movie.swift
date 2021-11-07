//
//  Movie.swift
//  iOSNetworking
//
//  Created by Sigit Hanafi on 05/11/21.
//

import Foundation

internal struct MovieResponse: Decodable {
    internal let data: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case data = "results"
    }
}

internal struct Movie: Decodable {
    internal let title: String
    internal let overview: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
    }
}
