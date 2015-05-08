//
//  AuthManager.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import Foundation
import SwiftyJSON
import Locksmith

public class AuthManager : NSObject{
    
    static var currentUser:User? {
        get{
            
            if (self.user == nil){
                self.user = loadUser();
            }
            return self.user
        }
        set(newUser){
            
            self.user = newUser;
            storeUser(self.user)
        }
    }
    
    private static var user:User?
    
    public static func login(username:String, password:String, callback: ((valid:Bool) -> ())?){
        
        WebServices.testCredentials(username, password: password) { (user) -> () in
            
            if username == user.username{
                
                let dict:Dictionary = ["username":username,"password":password]
                let error = Locksmith.saveData(dict, forUserAccount: kKeychainUserAccount)
                
                self.currentUser = user
            }
            
            if let callback = callback{
                callback(valid: (username == user.username))
            }
        }
    }
    
    public static func logout() {
        user = nil;
        Locksmith.deleteDataForUserAccount(kKeychainUserAccount)
        clearUser()
        
    }
    
    public static func isLoggedIn() -> Bool{
        
        if let currentUser = currentUser {
            return currentUser.username != ""
        }else{
            return false
        }
    }
    
    private static func clearUser() {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.removeObjectForKey("currentUser")
    }
    
    private static func loadUser() -> User?{
        
        let ud = NSUserDefaults.standardUserDefaults()
        let jsonString:String? = ud.objectForKey("currentUser") as? String;
        
        if let jsonString = jsonString, dataFromString = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            
            let json = JSON(data: dataFromString)
            return User(json: json)
        }else{
            return nil
        }
    }
    
    private static func storeUser(user: User?){
        if let user = user {
            let ud = NSUserDefaults.standardUserDefaults()
            
            let string = user.toJSON().rawString()
            
            if let string = string {
                ud.setObject(string, forKey: "currentUser")
            }
        }
    }
}
