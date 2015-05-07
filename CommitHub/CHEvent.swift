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
}