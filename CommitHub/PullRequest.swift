//
//  PullRequest.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class PullRequest: CHObject {
    
    let issue: Issue
    
    init(json: JSON) {
        
        issue = Issue(json: json)
        
        super.init(url: json["url"].string);
    }
}
