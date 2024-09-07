//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Saeed on 8/24/24.
//

import Foundation

public typealias ClientResult = Result<(Data,HTTPURLResponse), Error>

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (ClientResult) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = Swift.Result<[FeedItem], Error>
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { result  in
            switch result {
            case .success:
                completion(.failure(.invalidData))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
