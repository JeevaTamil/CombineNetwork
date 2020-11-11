//
//  UserModel.swift
//  CombineNetwork
//
//  Created by Azhagusundaram Tamil on 11/11/20.
//

import Foundation

struct UserResults: Decodable {
    var users: [User]
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct User: Decodable {
    var name: Name
    var email: String
    var phone: String
}

struct Name: Decodable {
    var first: String
    var last: String
}

