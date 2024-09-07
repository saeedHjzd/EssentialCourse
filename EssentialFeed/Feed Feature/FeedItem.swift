//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Saeed on 8/21/24.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
