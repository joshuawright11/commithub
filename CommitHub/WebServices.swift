//
//  WebServices.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import Foundation
import Alamofire

class WebServices: NSObject {
    
    class HTTPRequest {
        var url: String

        init(url:String){
            self.url = url;
        }
        
        func request() -> (code:Int, response:String){
            Alamofire.request(.GET, url)
                .responseString { (_, _, string, _) in
                    println(string)
            }
            return (0, "hi");
        }
    }
    
    class POSTRequest: HTTPRequest {
        
    }
    
    class GETRequest: HTTPRequest {
        
    }
}