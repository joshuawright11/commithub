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
    required init(json: JSON) {
        self.url = json["url"].stringValue.stringByReplacingOccurrencesOfString("https://api.github.com/", withString: "")
        println(self.url)
    }
    
    static func initArrayWithJSON<T:CHObject>(json: JSON) -> [T] {
        
        var array = [T]()
        
        for (index: String, subJson: JSON) in json {
            array.append(T(json: subJson))
        }
        
        return array;
    }
}
