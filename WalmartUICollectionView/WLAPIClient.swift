//
//  WLAPIClient.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation
import UIKit

/**
 Communicates with
*/
class WLAPIClient {

    static let sharedInstance = WLAPIClient()
    var BASE_URL:String
    var WL_API_CLIENT_ID:String

    private init() {
        BASE_URL = APIKeys.valueForAPIKey(named: String("WALMART_BASE_URL")) as! String
        WL_API_CLIENT_ID = APIKeys.valueForAPIKey(named: String("WALMART_API_CLIENT_ID")) as! String
    }
    
    func loadBestSellerProducts(completion:([Category])->()) {
        let url = NSURL(string: WLAPIClient.sharedInstance.BASE_URL+"v1/feeds/bestsellers?apikey="+WL_API_CLIENT_ID+"&categoryId=3944&format=json")!

        let task = NSURLSession.sharedSession()
            .dataTaskWithURL(url) { (data, response, error) in
                guard error == nil else {
                    return print("Something bad \(error!.localizedDescription)")
                }
                guard let data = data else {
                    return print("No Data! Sorry Bro")
                }
                guard let json = try! NSJSONSerialization
                    .JSONObjectWithData(data, options: []) as? NSDictionary else {
                        return print("Not a dictionary")
                }

                guard let items = json["items"] as? NSArray else {
                        return print("No items")
                }


                var newItems = [Product]()
                //print (items)
                for thing in items {
                    guard let newItem = Product(json: thing) else { continue }
                    newItems.append(newItem)
                }

                let category = Category(name: "Best Sellers", products: newItems)
                var bestSellerCategory = [Category]()
                bestSellerCategory.append(category)
                dispatch_async(dispatch_get_main_queue(), {
                    completion(bestSellerCategory)
                })
        }
        task.resume()
    }


    static func fetchImage(imageURL:String, completion: (image: UIImage?) -> ()) {
        //get image from from URL
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string:imageURL)!) {
            (data, response, error) in
            let image = UIImage(data:data!)
            dispatch_async(dispatch_get_main_queue()){
                completion(image: image)
            }
        }
        task.resume()
    }

}