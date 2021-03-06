//
//  Commit.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class Commit: CHObject {
    
    let sha:String
    let message:String
    let date:NSDate
    let commentCount:Int
    let author:User
    let committer:User
    
    required init(json: JSON) {
        sha = json["sha"].stringValue
        message = json["commit"]["message"].stringValue
        date = dateFromString(json["commit"]["authot"]["date"].stringValue)
        commentCount = json["commit"]["comment_count"].intValue
        author = User(json: json["author"])
        committer = User(json: json["committer"])
        
        super.init(json: json);
    }
}
