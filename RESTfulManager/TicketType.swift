//
//  TicketType.swift
//  RESTfulManager
//
//  Created by netas on 27.06.2016.
//  Copyright © 2016 netas. All rights reserved.
//

import Foundation

struct TicketType: DataModel {
    var name:String?
    var id:Int?
    
    func make(completionHandler:(result:ModelResult<Any, NSError>)->Void) -> Void {
        RestfulManager.sharedInstance.getPriorityList { (result) in
            completionHandler(result: result)
        }
    }
    
}

