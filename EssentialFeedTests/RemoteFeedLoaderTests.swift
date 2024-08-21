//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Saeed on 8/21/24.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    
    static var shared = HTTPClient()
        
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // MARK: - Arrange e.g. Given a client and sut
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        // MARK: - Act e.g. When we invoke sut.load()
        sut.load()
        
        // MARK: - Assert e.g. Then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
    }
    
}
