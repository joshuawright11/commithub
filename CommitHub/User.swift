//
//  User.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class User: CHObject {
    
    let username:String
    let avatarURL:String
    let name:String
    let company:String
    let blog:String
    let location:String
    let email:String
    let publicReposCount:Int
    let followersCount:Int
    let followingCount:Int
    let createdAt:NSDate
    
    init(json: JSON) {
        
        username = json["username"].stringValue
        avatarURL = json["avatar_url"].stringValue
        name = json["name"].stringValue
        company = json["company"].stringValue
        blog = json["blog"].stringValue
        location = json["location"].stringValue
        email = json["email"].stringValue
        publicReposCount = json["public_repos"].intValue
        followersCount = json["followers"].intValue
        followingCount = json["following"].intValue
        createdAt = Utilities.dateFromString(json["created_at"].stringValue)
        
        super.init(url: json["url"].string);
    }
}
