//
//  Comment.swift
//  CommitHub
//
//  Created by Josh Wright on 5/7/15.
//  Copyright (c) 2015 Josh Wright and Paul Haefliger. All rights reserved.
//

import SwiftyJSON

class Comment: CHObject {

    init(json: JSON) {
        super.init(url: json["url"].string);
    }
}