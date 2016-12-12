//
//  CollectionViewCellSetup.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

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

//    static func profileLogCell(cell : UICollectionViewCell, log: Log) -> UICollectionViewCell {
//        let real = cell as! ProfileLogCell
//        real.setup(log)
//        return cell
//    }

    static func wlProductURLCell(cell : UICollectionViewCell, product: Product) -> UICollectionViewCell {
        let real = cell as! WLProductDetailsCell
        real.setup(product)
        return cell
    }

//    static func wlProductPreviewSectionHeaderCell(cell : UICollectionViewCell, text: String) -> UICollectionViewCell {
//        let real = cell as! wlProductPreviewSectionHeaderCell
//        real.setup(text)
//        return cell
//    }

}
