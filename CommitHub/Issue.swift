//
//  Issue.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class Issue: CHObject {
    
    let number:Int
    let title:String
    let open:Bool
    let commentsCount:Int
    let createdAt:NSDate
    let updatedAt:NSDate
    let closedAt:NSDate
    let body:String
    let user:User
    
    required init(json: JSON) {
        
        number = json["number"].intValue
        title = json["title"].stringValue
        open = json["state"].stringValue != "closed"
        commentsCount = json["comments"].intValue
        createdAt = Utilities.dateFromString(json["created_at"].stringValue)
        updatedAt = Utilities.dateFromString(json["updated_at"].stringValue)
        closedAt = Utilities.dateFromString(json["closed_at"].stringValue)
        body = json["body"].stringValue
        user = User(json: json["user"])
        
        super.init(json: json);
    }
}
