//
//  LibraryAPI.swift
//  RESTfulManager
//
//  Created by netas on 27.06.2016.
//  Copyright © 2016 netas. All rights reserved.
//

import Foundation



class LibraryAPI:NSObject {
    
    private let httpClient:HTTPClient
    
    override init() {
         httpClient = HTTPClient()
        
        super.init()
    }
    
    class var sharedInstance:LibraryAPI {
        struct Singleton {
            static let instance = LibraryAPI()
        }
        
        return Singleton.instance
    }
    
    
    func getRequest()  {
        //httpClient.getRequest("http://217.78.97.152:50003/api/services/appNotification/requestPriority/getAllRequestPriority")
        
        
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
    
    func getPriorityList(completionHandler:(result:ModelResult)->Void) -> Void{
        httpClient.postRequest("http://217.78.97.152:50003/api/services/appNotification/requestPriority/getAllRequestPriority") { (response) in
            switch response.result {
            case .Success(let data):
                
                
                guard let requestPriorityData =  data["result"]??["requestPriorityListModel"] as? NSArray else {
                    //completionHandler(result: .Failure(NSError(domain: "test", code: 123, userInfo: nil))
                    completionHandler(result: .Failure(NSError(domain: "test", code: 123, userInfo: nil)))
                    return
                }
                
                
                var priorityList:[Priority] = []
                    
                for value in requestPriorityData {
                  let priority:Priority = Priority(name: value["name"] as? String, id: value["id"] as? Int)
                        
                    priorityList.append(priority)
 
                }
                completionHandler(result: .Success(priorityList))
            
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
