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
        
        //短縮したurlを取得する
        func bitlyAPI(longURL: String, then: @escaping (KusabiResponse?) -> ()){
            
            let token = "703c5bc4c4a2e028e7626946f674dfa52fcee533"
            
            let kusabi = Kusabi(URL: "https://api-ssl.bitly.com/v4/shorten", cachePolicy: .reloadIgnoringCacheData, timeOut: 100)
            
            let header = Header([HeaderItem(key: "Authorization", value: "Bearer \(token)"), HeaderItem(key: "Content-Type", value: "application/json")])
            
            let body = Body(string: "{ \"long_url\": \"\(longURL)\", \"domain\": \"bit.ly\", \"group_guid\": \"o_2mj6cu4932\" }", encoding: .utf8)
            
            // セマフォの初期化
            let semaphore = DispatchSemaphore(value: 0)
            
            var response: KusabiResponse?
            
            kusabi.GET(body: body, header: header, completion: { result in
                response = result
                
                // 処理終了でセマフォをインクリメント
                semaphore.signal()
            })
            
            semaphore.wait()
            
            //返す
            then(response)
            
        }
        
        bitlyAPI(longURL: "https://qiita.com/s_emoto/items/deda5abcb0adc2217e86", then: { response in
            
            print(response?.data)
            
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
