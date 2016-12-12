//
//  APIKeys.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation

class APIKeys {
    static func valueForAPIKey(named keyname:String) -> AnyObject {
        let filePath = NSBundle.mainBundle().pathForResource("apikeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        let value:AnyObject = (plist?.objectForKey(keyname))!

        return value
    }
}