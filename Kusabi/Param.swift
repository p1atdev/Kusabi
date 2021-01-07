//
//  Param.swift
//  Kusabi
//
//  Created by 周廷叡 on 2021/01/07.
//

import Foundation

public class Body {
    
    let content: Data
    
    init (string: String, encoding: String.Encoding) {
        self.content = string.data(using: encoding)!
    }
    
    init (data: Data) {
        self.content = data
    }
}

public class Header {
    
    let header: [HeaderItem]
    
    func content() -> [String: String]{
        var dict: [String: String] = [:]
        
        self.header.forEach {
            dict.updateValue($0.content.first!.key , forKey: $0.content.first!.value)
        }
        
        return dict
    }
    
    init (_ header: [HeaderItem]) {
        self.header = header
    }
}

public class HeaderItem {
    
    let content: [String: String]
    
    init (key: String, value: String) {
        self.content = [key: value]
    }
}


public class Querys {
    
    let content: [URLQueryItem]
    
    init (query: Query) {
        self.content = [query.item()]
    }
}

public class Query {
    
    let name: String
    
    let value: String
    
    func item() -> URLQueryItem {
        return URLQueryItem(name: name, value: value)
    }
    
    init (name: String, value: String) {
        
        self.name = name
        
        self.value = value
        
    }
}
