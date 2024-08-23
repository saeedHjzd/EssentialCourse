//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Saeed on 8/21/24.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // MARK: - Arrange e.g. Given a client and sut
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        // MARK: - Act e.g. When we invoke sut.load()
        sut.load()
        
        // MARK: - Assert e.g. Then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
    }
    
}
