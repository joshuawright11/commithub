//
//  ForkEvent.swift
//  CommitHub
//
//  Created by Josh Wright on 5/7/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class ForkEvent: CHEvent {

    let forkee:Repository
    
    required init(json:JSON){
        
        forkee = Repository(json: json["payload"]["forkee"])
        
        super.init(json: json)
    }
}
