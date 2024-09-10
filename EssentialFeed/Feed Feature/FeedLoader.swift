//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Saeed on 8/21/24.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedItem], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
