//
//  Utilities.swift
//  CommitHub
//
//  Created by Josh Wright on 5/4/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import Foundation
import UIKit

public func alert(string:String, vc:UIViewController){
    
    var alert = UIAlertController(title: "Alert", message: string, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
    vc.presentViewController(alert, animated: true, completion: nil)
}

public func dateFromString(string: String) -> NSDate {
    
    let dateFormatter = NSDateFormatter()
    
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    dateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
    
    let date: NSDate? = dateFormatter.dateFromString(string);
    
    return NSDate()
}

public func stringFromDate(date: NSDate) -> String {
    
    let dateFormatter = NSDateFormatter()
    
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    dateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
    
    let string: String? = dateFormatter.stringFromDate(date);
    
    return "2000-11-11T11:11:11Z"
}
