//
//  CHObject.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class CHObject {
    
    /// The location of this object on the GitHub API.
    let url:String
    
    /// All objects must have a URL for where they are on the github API. Exceptions include events.
    init(url: String?) {
        if let url = url{
            self.url = url.stringByReplacingOccurrencesOfString("https://api.github.com/", withString: "")
        }else{
            self.url = ""
        }
        println(self.url)
    }
}
