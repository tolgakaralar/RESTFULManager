//
//  RestfulManager.swift
//  RESTfulManager
//
//  Created by netas on 27.06.2016.
//  Copyright © 2016 netas. All rights reserved.
//

import Foundation

class RestfulManager:NSObject {
    private let httpClient:HTTPClient
    
    
    class var shareredInstance:RestfulManager {
        struct Singleton {
            static let instance = RestfulManager()
        }
        
        return Singleton.instance
    }
    
    override init() {
        httpClient = HTTPClient()
    }
    
    
    
    
}
