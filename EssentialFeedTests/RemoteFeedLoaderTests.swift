//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Saeed on 8/21/24.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // MARK: - Arrange e.g. Given a client and sut
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        // MARK: - Act e.g. When we invoke sut.load()
        sut.load()
        
        // MARK: - Assert e.g. Then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
    }
    
}
