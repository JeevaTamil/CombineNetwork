//
//  UserViewModel.swift
//  CombineNetwork
//
//  Created by Azhagusundaram Tamil on 11/11/20.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {
    @Published var userViewModels = [UserViewModel]()
    private let apiManager: APIManager = APIManager()
    
    func fetchUsers(endpoint: URLEndPoint) {
        let url = URL(string: endpoint.urlString)!
        
        apiManager.fetch(url: url) { (result: Result<UserResults, Error>) in
            switch result {
            case .success(let result):
                self.userViewModels = result.users.map{ UserViewModel($0) }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct UserViewModel: Identifiable {
    let id = UUID()
    private let user: User
    
    var name: String {
        return user.name.first + user.name.last
    }
    
    var email: String {
        return user.email
    }
    
    var phone: String {
        return user.phone
    }
    
    init(_ user: User) {
        self.user = user
    }
}

