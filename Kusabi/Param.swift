//
//  Param.swift
//  Kusabi
//
//  Created by 周廷叡 on 2021/01/07.
//

import Foundation

/// request body
public class Body {
    
    let content: Data
    
    public init (string: String, encoding: String.Encoding) {
        self.content = string.data(using: encoding)!
    }
    
    public init (data: Data) {
        self.content = data
    }
}

/// request header
public class Header {
    
    let header: [HeaderItem]
    
    func content() -> [String: String]{
        var dict: [String: String] = [:]
        
        self.header.forEach {
            dict.updateValue($0.content.first!.value , forKey: $0.content.first!.key)
        }
        
        return dict
    }
    
    public init (_ header: [HeaderItem]) {
        self.header = header
    }
}

/// request header item
public class HeaderItem {
    
    let content: [String: String]
    
    public init (key: String, value: String) {
        self.content = [key: value]
    }
}


/// request querys
public class Querys {
    
    let content: [URLQueryItem]
    
    public init (querys: [Query]) {
        self.content = querys.map {$0.item()}
    }
}

/// request query
public class Query {
    
    let name: String
    
    let value: String
    
    func item() -> URLQueryItem {
        return URLQueryItem(name: name, value: value)
    }
    
    public init (name: String, value: String) {
        
        self.name = name
        
        self.value = value
        
    }
}
