//
//  APIManer.swift
//  CombineNetwork
//
//  Created by Azhagusundaram Tamil on 11/11/20.
//

import Foundation
import Combine

class APIManager {
    
    private var subscriber = Set<AnyCancellable>()
    
    func fetch<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void )  {
    
        // 1. Create 'dataTaskPusblisher'(Publisher) to make the API call
        URLSession.shared.dataTaskPublisher(for: url)
            // 2. Use 'map'(Operator) to get the data from the result
            .map { $0.data }
            // 3. Decode the data into the 'Decodable' struct using JSONDecoder
            .decode(type: T.self, decoder: JSONDecoder())
            // 4. Make this process in main thread. (you can do this in background thread as well)
            .receive(on: DispatchQueue.main)
            // 5. Use 'sink'(Subcriber) to get the decoaded value or error, and pass it to completion handler
            .sink { (resultCompletion) in
                switch resultCompletion {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    return
                }
            } receiveValue: { (resultArr) in
                completion(.success(resultArr))
            }
            // 6. saving the subscriber into an AnyCancellable Set (without this step this won't work)
            .store(in: &subscriber)
    }
}

