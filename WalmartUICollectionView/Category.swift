//
//  Category.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation

class Category {
    var name:String?
    var products:[Product]?

    init (name:String, products:[Product]) {
        self.name = name
        self.products = products
    }



}
