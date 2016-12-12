//
//  WLProductDescriptionCell.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

class WLProductDescriptionCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!

    static func sizeForItem(product: Product) -> CGSize {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = WLConstants.fontSemiBoldSized(15)
        label.text = String("Sale Price: $" + (product.salePrice?.description)! + ", MSRP: $" + (product.msrpPrice?.description)!)

        
        let padding : CGFloat = 8
        let width = UIScreen.mainScreen().bounds.size.width - (padding * 2)

        let titleSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.font = WLConstants.fontRegularSized(15)
        label.text = product.shortDescription!


        let descriptionSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))
        return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: descriptionSize.height + titleSize.height + (3 * padding))
    }

    func setup(product : Product) {
        titleLabel.font = WLConstants.fontSemiBoldSized(15);
//        titleLabel.layer.borderColor = UIColor.redColor().CGColor
//        titleLabel.layer.borderWidth = 0.5
        titleLabel.text = String("Sale Price: $" + (product.salePrice?.description)! + ", MSRP: $" + (product.msrpPrice?.description)!)


        print("description:\n" + product.shortDescription!)

        descriptionLabel.text = String("Description\n" + product.shortDescription!)
        descriptionLabel.font = WLConstants.fontRegularSized(15)
//        descriptionLabel.layer.borderWidth = 0.5
//        descriptionLabel.layer.borderColor = UIColor.greenColor().CGColor

        var size = self.titleLabel.sizeThatFits(CGSize(width: self.titleLabel.frame.size.width, height: CGFloat.max))
        titleHeight.constant = size.height
        size = self.descriptionLabel.sizeThatFits(CGSize(width: self.descriptionLabel.frame.size.width, height: CGFloat.max))
        descriptionHeight.constant = size.height
    }


}
