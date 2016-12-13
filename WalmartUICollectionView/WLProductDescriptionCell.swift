//
//  WLProductDescriptionCell.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

/**
 The class describes the product description cell within the WLProductDetailsView
*/
class WLProductDescriptionCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!

    /**
     Calculates the height for the cell by recreating the text and adding the height of each view together
     - parameter product: Product object
     - Returns: Size of the cell
     */
    static func sizeForItem(product: Product) -> CGSize {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = WLConstants.fontSemiBoldSized(15)
        label.text = product.getPriceText((product.salePrice?.description)!, msrpPrice: (product.msrpPrice?.description)!)

        let padding : CGFloat = 8
        let width = UIScreen.mainScreen().bounds.size.width - (padding * 2)

        let titleSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.font = WLConstants.fontRegularSized(15)
        label.text = product.getDescriptionText()

        let descriptionSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))
        return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: descriptionSize.height + titleSize.height + (3 * padding))
    }

    /**
     Setups the cell to contain data from the Product object
     - parameters product: Product object
     */
    func setup(product : Product) {
        titleLabel.font = WLConstants.fontSemiBoldSized(15);
        titleLabel.text = product.getPriceText((product.salePrice?.description)!, msrpPrice: (product.msrpPrice?.description)!)

        //descriptionLabel.text = String("Description\n" + product.shortDescription!)
        descriptionLabel.text = product.getDescriptionText()
        descriptionLabel.font = WLConstants.fontRegularSized(15)

        var size = self.titleLabel.sizeThatFits(CGSize(width: self.titleLabel.frame.size.width, height: CGFloat.max))
        titleHeight.constant = size.height
        size = self.descriptionLabel.sizeThatFits(CGSize(width: self.descriptionLabel.frame.size.width, height: CGFloat.max))
        descriptionHeight.constant = size.height
    }


}
