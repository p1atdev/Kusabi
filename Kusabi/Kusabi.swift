//
//  Kusabi.swift
//  Kusabi
//
//  Created by 周廷叡 on 2021/01/07.
//

import Foundation

public class Kusabi {
    
    //対象のURL
    let URL: KusabiURLObject
    
    var request: NSMutableURLRequest
    
    //MARK: GET
    public func GET(body: Body? = nil, header: Header? = nil, querys: Querys? = nil, completion: @escaping (KusabiResponse?)->()) {
        
        //クエリーをセット
        if querys != nil {
            var urlComponents = URL.urlComponents()  //URLComponentsでURLを生成
            
            urlComponents.queryItems = querys!.content
            
            request = URLRequest(url: urlComponents.url!) as! NSMutableURLRequest
        }
        
        //getにする
        request.httpMethod = "GET"
        
        //ボディーをセット
        request.httpBody = body?.content
        
        //ヘッダーをセット
        request.allHTTPHeaderFields = header?.content()
        
        // セマフォの初期化
        let semaphore = DispatchSemaphore(value: 0)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            //返す
            completion(KusabiResponse(data: data, response: response, error: error))
            
            // 処理終了でセマフォをインクリメント
            semaphore.signal()
        })
        
        //通信
        task.resume()
        
        // デクリメントして待つ
        semaphore.wait()
        
    }
    
    
    //MARK: POST
    public func POST(body: Body? = nil, header: Header? = nil, querys: Querys? = nil, completion: @escaping (KusabiResponse?)->()) {
        
        //クエリーをセット
        if querys != nil {
            var urlComponents = URL.urlComponents()  //URLComponentsでURLを生成
            
            urlComponents.queryItems = querys!.content
            
            request = URLRequest(url: urlComponents.url!) as! NSMutableURLRequest
        }
        
        //postにする
        request.httpMethod = "POST"
        
        //ボディーをセット
        request.httpBody = body?.content
        
        //ヘッダーをセット
        request.allHTTPHeaderFields = header?.content()
        
        // セマフォの初期化
        let semaphore = DispatchSemaphore(value: 0)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            //返す
            completion(KusabiResponse(data: data, response: response, error: error))
            
            // 処理終了でセマフォをインクリメント
            semaphore.signal()
        })
        
        //通信
        task.resume()
        
        // デクリメントして待つ
        semaphore.wait()
        
    }
    
    public init (URL: URL, cachePolicy: NSURLRequest.CachePolicy, timeOut: TimeInterval) {
        self.URL = KusabiURLObject(URL: URL)
        
        self.request = NSMutableURLRequest(
            url: self.URL.URL,
            cachePolicy: cachePolicy,
            timeoutInterval: timeOut
        )
    }
    
    public init (URL: String, cachePolicy: NSURLRequest.CachePolicy, timeOut: TimeInterval) {
        self.URL = KusabiURLObject(URL: URL)
        
        self.request = NSMutableURLRequest(
            url: self.URL.URL,
            cachePolicy: cachePolicy,
            timeoutInterval: timeOut
        )
    }
    
}


//MARK: KusabiURLObject
public class KusabiURLObject {
    
    let URL: URL
    
    func urlComponents() -> URLComponents {
        return URLComponents(url: self.URL, resolvingAgainstBaseURL: false)!
    }
    
    public init (URL: URL) {
        self.URL = URL
    }
    
    public init (URL: String) {
        self.URL = NSURL(string: URL)! as URL
    }
}


public class KusabiResponse {
    public let data: Data?
    public let response: HTTPURLResponse?
    public let error: Error?
    
    public init (data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response as? HTTPURLResponse
        self.error = error
    }
}

