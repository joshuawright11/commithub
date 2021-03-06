//
//  Comment.swift
//  CommitHub
//
//  Created by Josh Wright on 5/7/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class Comment: CHObject {

    let user:User
    let createdAt:NSDate
    let updatedAt:NSDate
    let body:String
    
    required init(json: JSON) {
        
        user = User(json: json["user"])
        createdAt = dateFromString(json["createdAt"].stringValue)
        updatedAt = dateFromString(json["updatedAt"].stringValue)
        body = json["body"].stringValue
        
        super.init(json: json);
    }
}
