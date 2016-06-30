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
    
    override init() {
        httpClient = HTTPClient()
        
        super.init()
    }
    
    class var sharedInstance:RestfulManager {
        struct Singleton {
            static let instance = RestfulManager()
        }
        
        return Singleton.instance
    }
    
    
    func getOpenTicketList()->[Ticket] {
        return [Ticket]()
    }
    
    func getClosedTicketList()->[Ticket] {
        return [Ticket]()
    }
    
    func getCurrentTicketList()->[Ticket] {
        return [Ticket]()
    }
    
    func createTicket()->(Bool) {
        return true
    }
    
    func getPriorityList(completionHandler:(result:ModelResult<Any, NSError>)->Void) -> Void{
        httpClient.postRequest(RestFUKConstants.PriorityListUrl) { (response) in
            switch response.result {
            case .Success(let data):
                
                guard let success = data["success"] as? Bool where success == true else{
                    let error =  NSError(domain: "netas", code: -99, userInfo: [NSLocalizedDescriptionKey : "success is false"])
                    completionHandler(result: .Failure(error))
                    
                    return
                }
                
                guard let requestPriorityData:NSArray? =  data["result"]??["requestPriorityListModel"] as? NSArray else {
                    let error =  NSError(domain: "netas", code: -99, userInfo: [NSLocalizedDescriptionKey : "key value is not paired"])
                    completionHandler(result: .Failure(error))
                    return
                }
                
                var priorityList:[Priority] = []
                
                for value in requestPriorityData! {
                    let priority:Priority? = Priority(name: value["name"] as? String, id: value["id"] as? Int)
                    
                    priorityList.append(priority!)
                    
                }
                completionHandler(result: .Success(priorityList ))
                
            case .Failure(let error):
                completionHandler(result: .Failure(error))
            }
        }
    }
    
    
    func getTicketTypeList()->[TicketType] {
        return [TicketType(name: "dummy", id: 2)]
    }
    
    func subCatalogById(id:Int) {
        
    }
    
    
    
    
}
