//
//  URLEndPointa.swift
//  CombineNetwork
//
//  Created by Azhagusundaram Tamil on 11/11/20.
//

import Foundation

enum URLEndPoint {
    case users
    
    var baseUrl: String {
      return "https://randomuser.me/api/"
    }
    
    var urlString: String {
        switch self {
        case .users:
            return "https://randomuser.me/api/?nat=us&results=20"
        }
    }
}


extension URLEndPoint {
    func buildUrlComponents(nation: String, results: Int) -> URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "randomuser.me"
        component.path = "/api"
        
        let queryItemNat = URLQueryItem(name: "nat", value: nation)
        let queryItemResults = URLQueryItem(name: "results", value: "\(results)")
        component.queryItems = [queryItemNat, queryItemResults]
        
        return component
    }
}
