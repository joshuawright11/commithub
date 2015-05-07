//
//  WatchEvent.swift
//  CommitHub
//
//  Created by Josh Wright on 5/7/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class WatchEvent: CHEvent {

    required init(json:JSON){
        
        super.init(json: json)
    }
}
