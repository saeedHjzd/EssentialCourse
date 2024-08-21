//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Saeed on 8/21/24.
//

import Foundation

typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}