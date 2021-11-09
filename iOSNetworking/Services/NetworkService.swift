//
//  NetworkService.swift
//  iOSNetworking
//
//  Created by Sigit Hanafi on 05/11/21.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchPopularMovies(onSuccess: @escaping (_ data: [Movie]) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetchPopularMovies(onSuccess: @escaping ([Movie]) -> Void) {
        
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=9d2a61648c32785276abeaee4471a2f9")
            .validate()
            .responseDecodable(of: MovieResponse.self) { response in
                guard let response = response.value else { return }
                onSuccess(response.data)
            }
    }
}
