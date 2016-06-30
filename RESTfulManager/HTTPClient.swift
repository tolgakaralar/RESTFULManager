//
//  HTTPClient.swift
//  RESTfulManager
//
//  Created by netas on 27.06.2016.
//  Copyright © 2016 netas. All rights reserved.
//

import Foundation
import Alamofire

class HTTPClient {
    func getRequest(url:String = "", completionHandler:(Response<AnyObject, NSError>)->Void) {
       
 }
    
    func postRequest(url: String = "", body: [String:AnyObject] = ["":""], header: [String:String] = ["Authorization":"" ,"Content-Type":"application/json"], completionHandler:(response:Response<AnyObject, NSError>)->Void) -> Void  {
        Alamofire.request(.POST, url ,parameters: body, headers:header,encoding:.JSON )
            .validate()
            .responseJSON { response in
                completionHandler(response: response)
        }

        
    }
    
}
