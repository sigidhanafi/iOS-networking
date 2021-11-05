//
//  NetworkService.swift
//  iOSNetworking
//
//  Created by Sigit Hanafi on 05/11/21.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchPopularMovies(onSuccess: @escaping (_ data: [Movie]) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetchPopularMovies(onSuccess: @escaping ([Movie]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let movie1 = Movie(title: "title 1", overview: "Description movie 1")
            let movie2 = Movie(title: "title 2", overview: "Description movie 2")
            
            let data: [Movie] = [movie1, movie2]
            
            onSuccess(data)
        }
    }
}
