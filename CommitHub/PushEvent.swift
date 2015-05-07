//
//  PushEvent.swift
//  CommitHub
//
//  Created by Josh Wright on 5/7/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class PushEvent: CHEvent {

    let branch:String
    let commits:[Commit]
    
    override init(json:JSON){

        var commitsArray = [Commit]()
        for (index: String, subJson: JSON) in json["payload"]["commits"] {
            commitsArray.append(Commit(json: subJson))
        }
        commits = commitsArray
        branch = json["payload"]["ref"].stringValue
        
        super.init(json: json)
    }
}
