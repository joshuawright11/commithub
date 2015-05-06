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
        var thing:WebServices.HTTPRequest = WebServices.HTTPRequest(url: "http://httpbin.org/get");
        thing.request();
    }

}

