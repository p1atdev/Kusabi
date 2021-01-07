//
//  KusabiTests.swift
//  KusabiTests
//
//  Created by 周廷叡 on 2021/01/07.
//

import XCTest
@testable import Kusabi

class KusabiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let header: Header = Header([
            HeaderItem(key: "x-rapidapi-host", value: "covid-193.p.rapidapi.com"),
            HeaderItem(key: "x-rapidapi-key", value: "b9dbf5087dmsh1d6c19e36c1c6b8p1697e6jsn4af1047106b2")])
        
        let query: Querys = Querys(querys: [Query(name: "country", value: "japan")])
        
        let kusabi = Kusabi(
            URL: "https://covid-193.p.rapidapi.com/statistics",
            cachePolicy: .useProtocolCachePolicy,
            timeOut: 10.0)
        
        kusabi.GET(header: header, querys: query, completion: { result in
            
            let jsonString = String(data: result!.data!, encoding: .utf8)!
            
            print("Response Data: ", jsonString)
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            let header: Header = Header([
                HeaderItem(key: "x-rapidapi-host", value: "shorturl-sfy-cx.p.rapidapi.com"),
                HeaderItem(key: "x-rapidapi-key", value: "b9dbf5087dmsh1d6c19e36c1c6b8p1697e6jsn4af1047106b2")])
            
            let kusabi = Kusabi(
                URL: "https://shorturl-sfy-cx.p.rapidapi.com/?url=https%253A%252F%252Fwww.google.com",
                cachePolicy: .useProtocolCachePolicy,
                timeOut: 10.0)
            
            kusabi.GET(header: header, completion: { result in
                print(result!.response!)
            })
        }
    }

}
