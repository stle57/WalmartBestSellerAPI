//
//  CollectionViewCellReuse.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation

import UIKit

class CollectionViewCellReuse: NSObject {

    let collectionView : UICollectionView

    init(collectionView: UICollectionView, cells: [String]) {
        self.collectionView = collectionView
        for cellIdentifier in cells {
            self.collectionView.registerNib(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        }
    }

    func getReusableCellForIdentifier(identifier : String, indexPath: NSIndexPath) -> UICollectionViewCell {
        return self.collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) 
    }
}
