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
        let testuser = "joshuawright11"
        let testpasswd = "U8sspg8w"
        
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
        WebServices.doGetRequest("user", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getCurrentUserIssues(callback: ((issues: [Issue]) -> ())?){
        WebServices.doGetRequest("user/issues", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getCurrentUserRepos(callback: ((repos: [Repository]) -> ())?){
        WebServices.doGetRequest("user/repos", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getCurrentUserPullRequests(callback: ((requests: [PullRequest]) -> ())?){
        WebServices.doGetRequest("user/repos", completionClosure: { (json) -> () in
            
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
        WebServices.doGetRequest("\(user.url)/starred", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getUserFollowers(user:User, callback: ((followers: [User]) -> ())?){
        WebServices.doGetRequest("\(user.url)/followers", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getUserFollowing(user:User, callback: ((following: [User]) -> ())?){
        WebServices.doGetRequest("\(user.url)/following", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getUserRepos(user:User, callback: ((repos: [Repository]) -> ())?){
        WebServices.doGetRequest("\(user.url)/repos", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getUserActivity(user:User, callback: ((activity: [CHEvent]) -> ())?){
        WebServices.doGetRequest("\(user.url)/events", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getUserWatchedRepos(user: User, callback: ((watched: [Repository]) -> ())?){
        WebServices.doGetRequest("\(user.url)/subscriptions", completionClosure: { (json) -> () in
            
        })
    }
    
    /// MARK: - Repo Calls
    
    static func getRepoCommits(repo:Repository, callback: ((commits: [Commit]) -> ())?){
        WebServices.doGetRequest("\(repo.url)/commits", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getRepoBranches(repo:Repository, callback: ((branchNames: [String]) -> ())?){
        WebServices.doGetRequest("\(repo.url)/branches", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getRepoReleases(repo: Repository, callback: ((releaseNames: [String]) -> ())?){
        WebServices.doGetRequest("\(repo.url)/releases", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getRepoCollaborators(repo:Repository, callback: ((collaborators: [User]) -> ())?){
        WebServices.doGetRequest("\(repo.url)/collaborators", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getRepoIssues(repo:Repository, callback: ((issues: [Issue]) -> ())?){
        WebServices.doGetRequest("\(repo.url)/issues", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getRepoPullRequests(repo:Repository, callback: ((requests: [PullRequest]) -> ())?){
        WebServices.doGetRequest("\(repo.url)/pulls", completionClosure: { (json) -> () in
            
        })
    }
    
    /// MARK: - Issue Calls
    
    static func getIssue(repo:Repository, number:Int, callback: ((issue: Issue) -> ())?){
        WebServices.doGetRequest("\(repo.url)/issues/\(number)", completionClosure: { (json) -> () in
            
        })
    }
    
    static func getIssueComments(issue:Issue, callback: ((comments: [Comment]) -> ())?){
        WebServices.doGetRequest("\(issue.url)/comments", completionClosure: { (json) -> () in
            
        })
    }
    
    /// MARK: - Explore Calls
    
    static func getTrendingRepos(language:String, timeframe:TimeFrame, callback: ((repos: [Repository]) -> ())?){
        WebServices.doGetRequest("search/repositories", completionClosure: { (json) -> () in
            
        })
        //filter by language etc
    }
    
}