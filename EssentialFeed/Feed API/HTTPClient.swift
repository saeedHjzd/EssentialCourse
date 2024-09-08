//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Saeed Hajizadeh on 6/18/1403 AP.
//

import Foundation

public typealias HTTPClientResult = Result<(Data,HTTPURLResponse), Error>

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
