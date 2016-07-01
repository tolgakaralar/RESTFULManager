//
//  DataModelFactory.swift
//  RESTfulManager
//
//  Created by netas on 1.07.2016.
//  Copyright © 2016 netas. All rights reserved.
//

import Foundation

protocol DataModel {
    func make(completionHandler:(result:ModelResult<Any, NSError>)->Void)->Void
}


public enum ModelType {
    case Priority, TicketType
}

enum DataModelFactory {
    static func model(modelType:ModelType) ->DataModel? {
        switch modelType {
        case .Priority :
            return Priority()
        case .TicketType:
            return TicketType()

        }

    }
}


