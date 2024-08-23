//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Saeed on 8/21/24.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        _ = RemoteFeedLoader(url: url, client: client)
                
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // MARK: - Arrange e.g. Given a client and sut
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        // MARK: - Act e.g. When we invoke sut.load()
        sut.load()
        
        // MARK: - Assert e.g. Then assert that a URL request was initiated in the client
        XCTAssertEqual(client.requestedURL, url)
    }
    
}
