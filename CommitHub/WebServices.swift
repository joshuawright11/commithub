//
//  WebServices.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebServices: NSObject {
    
    enum TimeFrame {
        case Day, Week, Month
    }
    
    /// Base class for HTTP Requests
    private class HTTPRequest {
        let BASE_URL = "https://api.github.com/"
        let url: String
        let method:Alamofire.Method
        
        // these will be on the keychain
        let testuser = "bogusaccount"
        let testpasswd = "bogusaccount1"
        
        init(url:String, method:Alamofire.Method){
            self.url = url
            self.method = method
        }
        
        func request(completionClosure: ((json:JSON) -> ())?){
        
            doHeaders()
          
            let request = Alamofire.request(.GET, BASE_URL+url)
            
            request.responseSwiftyJSON({ (req, res, json, error) in
                if let callback = completionClosure {
                    callback(json: json)
                }
            })
        }
        
        private func doHeaders(){
            let plainString = "\(testuser):\(testpasswd)" as NSString
            let plainData = plainString.dataUsingEncoding(NSUTF8StringEncoding)
            let base64String = plainData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
            Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = ["Authorization": "Basic " + base64String!, "Accept":"application/vnd.github.v3+json"]
        }
    }
    
    /// Do an HTTP GET request.
    static func doGetRequest(url: String, completionClosure: ((json: JSON) -> ())?){
        var thing:HTTPRequest = HTTPRequest(url: url, method: .GET)
        thing.request { (json) -> () in
            if let callback = completionClosure {
                callback(json: json)
            }
        }
    }
    
    /// MARK: - Current User Calls

    static func getCurrentUser(callback: ((user: User) -> ())?){
        doGetRequest("user", completionClosure: { (json) -> () in
            if let callback = callback {
                callback(user: User(json: json))
            }
        })
    }
    
    static func getCurrentUserIssues(callback: ((issues: [Issue]) -> ())?){
        doGetRequest("user/issues", completionClosure: { (json) -> () in
            if let callback = callback {
                callback(issues: CHObject.initArrayWithJSON(json))
            }
        })
    }
    
    static func getCurrentUserRepos(callback: ((repos: [Repository]) -> ())?){
        doGetRequest("user/repos", completionClosure: { (json) -> () in
            if let callback = callback {
                callback(repos: CHObject.initArrayWithJSON(json))
            }
        })
    }
    
    static func getCurrentUserPullRequests(callback: ((requests: [PullRequest]) -> ())?){
        doGetRequest("user/repos", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
        // find ones that are a pull request
    }
    
    // MARK: - User Calls
    
    static func getUser(username:String, callback: ((user: User) -> ())?){
        doGetRequest("users/\(username)", completionClosure: { (json) -> () in
            let user:User = User(json: json)
            if let callback = callback {
                callback(user: user)
            }
        })
    }
    
    static func getUserEventsReceived(user:User, callback: ((events: [CHEvent]) -> ())?){
        doGetRequest("\(user.url)/received_events", completionClosure: { (json) -> () in
            for (index: String, subJson: JSON) in json {}
        })
    }
    
    static func getUserStarred(user:User, callback: ((starred: [Repository]) -> ())?){
        doGetRequest("\(user.url)/starred", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getUserFollowers(user:User, callback: ((followers: [User]) -> ())?){
        doGetRequest("\(user.url)/followers", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getUserFollowing(user:User, callback: ((following: [User]) -> ())?){
        doGetRequest("\(user.url)/following", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getUserRepos(user:User, callback: ((repos: [Repository]) -> ())?){
        doGetRequest("\(user.url)/repos", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getUserActivity(user:User, callback: ((activity: [CHEvent]) -> ())?){
        doGetRequest("\(user.url)/events", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getUserWatchedRepos(user: User, callback: ((watched: [Repository]) -> ())?){
        doGetRequest("\(user.url)/subscriptions", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    /// MARK: - Repo Calls
    
    static func getRepoCommits(repo:Repository, callback: ((commits: [Commit]) -> ())?){
        doGetRequest("\(repo.url)/commits", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getRepoBranches(repo:Repository, callback: ((branchNames: [String]) -> ())?){
        doGetRequest("\(repo.url)/branches", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getRepoReleases(repo: Repository, callback: ((releaseNames: [String]) -> ())?){
        doGetRequest("\(repo.url)/releases", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getRepoCollaborators(repo:Repository, callback: ((collaborators: [User]) -> ())?){
        doGetRequest("\(repo.url)/collaborators", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getRepoIssues(repo:Repository, callback: ((issues: [Issue]) -> ())?){
        doGetRequest("\(repo.url)/issues", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getRepoPullRequests(repo:Repository, callback: ((requests: [PullRequest]) -> ())?){
        doGetRequest("\(repo.url)/pulls", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    /// MARK: - Issue Calls
    
    static func getIssue(repo:Repository, number:Int, callback: ((issue: Issue) -> ())?){
        doGetRequest("\(repo.url)/issues/\(number)", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    static func getIssueComments(issue:Issue, callback: ((comments: [Comment]) -> ())?){
        doGetRequest("\(issue.url)/comments", completionClosure: { (json) -> () in
            if let callback = callback {
                
            }
        })
    }
    
    /// MARK: - Explore Calls
    
    static func getTrendingRepos(language:String, timeframe:TimeFrame, callback: ((repos: [Repository]) -> ())?){
        doGetRequest("search/repositories", completionClosure: { (json) -> () in
            if let callback = callback {
                //filter by language etc
            }
        })
    }
}
