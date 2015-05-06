//
//  CHObject.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class CHObject : NSObject{
    
    /// The location of this object on the GitHub API.
    let url:String;
    
    init(url: String?) {
        if let url = url{
            /// TODO: parse off base url
            self.url = url;
        }else{
            self.url = "";
        }
    }
}
