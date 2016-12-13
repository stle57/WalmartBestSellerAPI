//
//  CollectionViewCellSetup.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

/**
 Contains methods which setup the different cells used within WLProductDetailsViewController
*/
class CollectionViewCellSetup {

    static func wlProductImageCell(cell : UICollectionViewCell, product: Product) -> UICollectionViewCell {
        // do more setup
        let real = cell as!  WLProductImageCell
        WLAPIClient.fetchImage(product.mediumImageURL!){ image in
            real.imageView.image = image
        }
        return cell
    }

    static func wlProductDescriptionCell(cell : UICollectionViewCell, product: Product) -> UICollectionViewCell {
        // do more setup
        let real = cell as! WLProductDescriptionCell
        real.setup(product)
        return real
    }

    static func wlProductURLCell(cell : UICollectionViewCell, product: Product) -> UICollectionViewCell {
        let real = cell as! WLProductDetailsCell
        real.setup(product)
        return cell
    }
}
