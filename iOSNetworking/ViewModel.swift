//
//  ViewModel.swift
//  iOSNetworking
//
//  Created by Sigit Hanafi on 05/11/21.
//

class ViewModel {
    // network service
    internal let networkService: NetworkServiceProtocol
    
    // callback / output
    internal var loadView: (([Movie]) -> Void)?
    internal var movies: [Movie]? {
        didSet {
            if let movies = movies {
                self.loadView?(movies)
            }
        }
    }
    
    internal init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    // trigger input
    internal func didLoadTrigger() {
        networkService.fetchPopularMovies { data in
            self.movies = data
        }
    }
}
