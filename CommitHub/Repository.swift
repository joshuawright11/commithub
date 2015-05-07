//
//  Repository.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class Repository: CHObject {
    
    let name:String
    let fullName:String
    let owner:User
    let isPrivate:Bool
    let description:String
    let fork:Bool
    let createdAt:NSDate
    let homepage:String
    let stargazersCount:Int
    let watchersCount:Int
    let language:String
    let hasIssues:Bool
    let forksCount:Int
    let openIssuesCount:Int
    let defaultBranch:String
    
    required init(json: JSON) {
        
        self.name = json["name"].stringValue;
        self.fullName = json["name"].stringValue
        self.owner = User(json: json["owner"])
        self.isPrivate = json["private"].boolValue
        self.description = json["description"].stringValue
        self.fork = json["fork"].boolValue
        self.createdAt = Utilities.dateFromString(json["created_at"].stringValue)
        self.homepage = json["homepage"].stringValue
        self.stargazersCount = json["stargazers_count"].intValue
        self.watchersCount = json["watchers_count"].intValue
        self.language = json["language"].stringValue
        self.hasIssues = json["has_issues"].boolValue
        self.forksCount = json["forks_count"].intValue
        self.openIssuesCount = json["open_issues_count"].intValue
        self.defaultBranch = json["default_branch"].stringValue
        
        super.init(json: json);
    }
}
