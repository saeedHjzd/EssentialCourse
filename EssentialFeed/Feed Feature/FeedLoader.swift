//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Saeed on 8/21/24.
//

import Foundation

public typealias LoadFeedResult<Error: Swift.Error> = Result<[FeedItem], Error>

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
