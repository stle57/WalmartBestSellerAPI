//
//  WLProductDetailsCell.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class WLProductDetailsCell: UICollectionViewCell, TTTAttributedLabelDelegate {

    @IBOutlet weak var titleLabel: TTTAttributedLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shippingRateLabel: UILabel!
    @IBOutlet weak var itemColorLabel: UILabel!

    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!
    @IBOutlet weak var shippingRateHeight: NSLayoutConstraint!
    @IBOutlet weak var itemColorHeight: NSLayoutConstraint!
    
    static func sizeForItem(product: Product) -> CGSize {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = WLConstants.fontRegularSized(15)
        label.text = "Buy Product"


        let padding : CGFloat = 8
        let width = UIScreen.mainScreen().bounds.size.width - (padding * 2)
        let titleSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.font = WLConstants.fontRegularSized(15)
        label.text = String("Model Number: " + product.modelNumber!)
        let descriptionSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.text = String("Shipping Rate: " + (product.standardShippingRate?.description)!)
        WLConstants.fontRegularSized(12)
        let shippingSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.text = String("Color: " + product.color!)
        let itemColorSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))


        return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: descriptionSize.height + titleSize.height + shippingSize.height + itemColorSize.height + (3 * padding))

    }

    func setup(product : Product) {
        titleLabel.layer.borderColor = UIColor.redColor().CGColor
        titleLabel.layer.borderWidth = 0.5
        titleLabel.font = WLConstants.fontRegularSized(15)

        let str : NSString = "Buy Product"
        titleLabel.delegate = self
        titleLabel.text = str as String
        let range : NSRange = str.rangeOfString("Buy Product")
        titleLabel.addLinkToURL(NSURL(string: product.productURL!)!, withRange: range)
        print ("product url=" + product.productURL!)

        descriptionLabel.text = String("Model Number: " + product.modelNumber!)
//        descriptionLabel.layer.borderWidth = 0.5
//        descriptionLabel.layer.borderColor = UIColor.greenColor().CGColor
        descriptionLabel.font = WLConstants.fontRegularSized(15)

        shippingRateLabel.text = String("Shipping Rate: " + (product.standardShippingRate?.description)!)
        shippingRateLabel.layer.borderWidth = 0.5
        shippingRateLabel.layer.borderColor = UIColor.greenColor().CGColor
        shippingRateLabel.font = WLConstants.fontRegularSized(12)

        itemColorLabel.text = String("Color: " + product.color!)
//        itemColorLabel.layer.borderWidth = 0.5
//        itemColorLabel.layer.borderColor = UIColor.greenColor().CGColor
        itemColorLabel.font = WLConstants.fontRegularSized(12)


        var size = self.titleLabel.sizeThatFits(CGSize(width: self.titleLabel.frame.size.width, height: CGFloat.max))
        titleHeight.constant = size.height
        size = self.descriptionLabel.sizeThatFits(CGSize(width: self.descriptionLabel.frame.size.width, height: CGFloat.max))
        descriptionHeight.constant = size.height

        size = self.shippingRateLabel.sizeThatFits(CGSize(width: self.shippingRateLabel.frame.size.width, height: CGFloat.max))
        shippingRateHeight.constant = size.height

        size = self.itemColorLabel.sizeThatFits(CGSize(width: self.itemColorLabel.frame.size.width, height: CGFloat.max))
        itemColorHeight.constant = size.height
    }

    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        UIApplication.sharedApplication().openURL(url)
    }
}
