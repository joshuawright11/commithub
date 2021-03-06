//
//  Event.swift
//  CommitHub
//
//  Created by Josh Wright on 5/7/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class CHEvent: CHObject {
    
    let user:User
    let repo:Repository
    
    required init(json: JSON) {
        
        user = User(json: json["actor"])
        repo = Repository(json: json["repo"])
        
        super.init(json: json);
    }
    
    static func initArrayWithJSON(json: JSON) -> [CHEvent] {
        
        var array = [CHEvent]()
        
        for (index: String, subJson: JSON) in json {
            switch subJson["type"].stringValue{
            case "PushEvent":
                array.append(PushEvent(json: subJson))
            case "WatchEvent":
                array.append(WatchEvent(json: subJson))
            case "ForkEvent":
                array.append(ForkEvent(json: subJson))
            case "CreateEvent":
                array.append(CreateEvent(json: subJson))
            default:
                array.append(CHEvent(json: subJson))
            }
        }
        
        return array;
    }
}