//
//  WLProductImageCell.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

class WLProductImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //    }

    static func sizeForItem() -> CGSize {
        print ("inside product image cell sizeforitem")
        return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.width)
    }

}
