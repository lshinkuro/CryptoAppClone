//
//  NetworkingManager.swift
//  KryptoAppSwiftUI
//
//  Created by nur kholis on 04/12/22.
//

import Foundation
import Combine

class NetworkingManager {
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case internalServerError
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "[🎃] bad response from URL: \(url)"
            case .internalServerError:
                return "[👌🏽] Internal Server Error"
            case .unknown:
                return "[⚠️] unknow error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
       return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap{ try handleUrlResponse(output: $0, url: url) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    static func handleUrlResponse(output : URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        if let res = output.response as? HTTPURLResponse {
            print("responseCode \(res.statusCode)")
            if res.statusCode >= 500 {
                throw NetworkingError.internalServerError
            } else if res.statusCode < 200 {
                throw NetworkingError.badURLResponse(url: url)
            }
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
