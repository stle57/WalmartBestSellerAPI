//
//  Category.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation

/*!
*  Category class holds an individual Cateogry which contains an Array of Products
*/
class Category {
    var name:String?
    var products:[Product]?

    /**
     Inititializes the Category object
     - parameter name: The category name.  i.e: Best Seller, Electronics
     - products: An array of Product objects
     */
    init (name:String, products:[Product]) {
        self.name = name
        self.products = products
    }



}
