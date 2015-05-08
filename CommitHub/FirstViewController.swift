//
//  FirstViewController.swift
//  CommitHub
//
//  Created by Josh Wright on 4/28/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        alert("alert", self)
    }
    
    func tempTest(){
        
        WebServices.getCurrentUser { (user) -> () in
            println(user.name);
        }
        
        WebServices.getCurrentUserIssues { (issues) -> () in
            for issue:Issue in issues{
                println(issue.title)
            }
        }
        
        WebServices.getCurrentUserRepos { (repos) -> () in
            for repo:Repository in repos {
                println(repo.name)
            }
        }
        
        WebServices.getCurrentUserPullRequests { (requests) -> () in
            for req:PullRequest in requests {
                println(req.url)
            }
        }
        
        WebServices.getUser("pushchris", callback: { (user) -> () in
            println(user.name)
            WebServices.getUserActivity(user, callback: { (activity) -> () in
                for event:CHEvent in activity{
                    if(event is PushEvent){
                        println("Push");
                    }else if(event is WatchEvent){
                        println("Watch");
                    }else if(event is ForkEvent){
                        println("Fork");
                    }else if(event is CreateEvent){
                        println("Create");
                    }else{
                        
                    }
                }
            })
            
            WebServices.getUserEventsReceived(user, callback: { (events) -> () in
                for event:CHEvent in events{
                    if(event is PushEvent){
                        println("Push");
                    }else if(event is WatchEvent){
                        println("Watch");
                    }else if(event is ForkEvent){
                        println("Fork");
                    }else if(event is CreateEvent){
                        println("Create");
                    }else{
                        
                    }
                }
            })
            
            WebServices.getUserFollowers(user, callback: { (followers) -> () in
                for user:User in followers {
                    println("Er: "+user.username)
                }
            })
            
            WebServices.getUserFollowing(user, callback: { (following) -> () in
                for user:User in following {
                    println("Ing: "+user.username)
                }
            })
            
            WebServices.getUserRepos(user, callback: { (repos) -> () in
                for repo:Repository in repos{
                    println("Own: "+repo.name)
                }
            })
            
            WebServices.getUserStarred(user, callback: { (starred) -> () in
                for repo:Repository in starred{
                    println("Starred: "+repo.name)
                }
            })
            
            WebServices.getUserStarred(user, callback: { (starred) -> () in
                var repo = starred[0];
                
                WebServices.getRepoBranches(repo, callback: { (branchNames) -> () in
                    for branch:String in branchNames{
                        println("Branch: "+branch)
                    }
                })
                
                WebServices.getRepoContributors(repo, callback: { (contributors) -> () in
                    for user:User in contributors{
                        println("Contrib: "+user.username)
                    }
                })
                
                WebServices.getRepoCommits(repo, callback: { (commits) -> () in
                    for com:Commit in commits{
                        println("Commit: "+com.message)
                    }
                })
                
                WebServices.getRepoIssues(repo, callback: { (issues) -> () in
                    for issue:Issue in issues{
                        println("Issue: "+issue.title)
                    }
                })
                
                WebServices.getRepoPullRequests(repo, callback: { (requests) -> () in
                    for req:PullRequest in requests {
                        println("Reqeust: "+req.url)
                    }
                })
                
                WebServices.getRepoReleases(repo, callback: { (releaseNames) -> () in
                    for rel:String in releaseNames {
                        println("REleasE: "+rel)
                    }
                })
                
                WebServices.getIssue(repo, number: 10, callback: { (issue) -> () in
                    println(issue.title)
                    WebServices.getIssueComments(issue, callback: { (comments) -> () in
                        for comment:Comment in comments {
                            println(comment.body)
                        }
                    })
                })
            })
        })
        
        WebServices.getMostStarredRepos("swift", callback: { (repos) -> () in
            for repo:Repository in repos {
                println(repo.name)
            }
        })
    }
}
