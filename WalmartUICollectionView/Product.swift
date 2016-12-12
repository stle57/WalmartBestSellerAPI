//
//  Product.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation

class Product {
    var name:String?
    var salePrice:Double?
    var msrpPrice:Double?
    var shortDescription:String?
    var thumbnailURL:String?
    var mediumImageURL:String?
    var productURL:String?
    var modelNumber:String?
    var color:String?
    var standardShippingRate:Double?

    init(name:String, price:Double, descriptionText:String, image:String) {
        self.name = name
        self.salePrice = price
        self.shortDescription = descriptionText
        self.thumbnailURL = image
    }

    init?(json: AnyObject) {

        guard let productItem = json as? NSDictionary,
            let name = productItem["name"] as? String,
            let modelNumber = productItem["modelNumber"] as? String,
            let image = productItem["thumbnailImage"] as? String,
            let shortDescription = productItem["shortDescription"] as? String,
            let productURL = productItem["productUrl"] as? String,
            let mediumImageURL = productItem["mediumImage"] as? String,
            let msrpPrice = productItem["msrp"] as? Double,
            let salePrice = productItem["salePrice"] as? Double,
            let standardShippingRate = productItem["standardShipRate"] as? Double,
            let color = productItem["color"] as? String else {
                return nil
        }
        
        self.name = name
        self.modelNumber = modelNumber
        self.thumbnailURL = image
        self.shortDescription = shortDescription
        self.salePrice = salePrice
        self.mediumImageURL = mediumImageURL
        self.productURL = productURL
        self.msrpPrice = msrpPrice
        self.color = color
        self.standardShippingRate = standardShippingRate
    }

    func printProductDetail() {
        print ("name: " + self.name!)
        print ("shortDescription: " + self.shortDescription!)
        print ("imageURL: " + self.thumbnailURL!)
        print ("price: " + (self.salePrice?.description)!)
        print ("modelNumber: " + self.modelNumber!)
        print ("mediumURL: " + self.mediumImageURL!)
        print ("productURL: " + self.productURL!)
        print ("color: " + self.color!)
        print ("standardShippingRate: " + (self.standardShippingRate?.description)!)
    }


}
