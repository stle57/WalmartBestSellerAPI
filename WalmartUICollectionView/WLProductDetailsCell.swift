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
        label.text = WLConstants.buyProductString()


        let padding : CGFloat = 8
        let width = UIScreen.mainScreen().bounds.size.width - (padding * 2)
        let titleSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.font = WLConstants.fontRegularSized(15)
        label.text = product.getModelText()
        let descriptionSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.text = product.getShippingRateText()
        WLConstants.fontRegularSized(15)
        let shippingSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))

        label.text = product.getColorText()
        let itemColorSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.max))


        return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: descriptionSize.height + titleSize.height + shippingSize.height + itemColorSize.height + (4 * padding))

    }

    func setup(product : Product) {
        titleLabel.font = WLConstants.fontRegularSized(15)

        let str : NSString = WLConstants.buyProductString()
        titleLabel.delegate = self
        titleLabel.text = str as String
        let range : NSRange = str.rangeOfString(WLConstants.buyProductString())
        titleLabel.addLinkToURL(NSURL(string: product.productURL!)!, withRange: range)

        descriptionLabel.text = product.getModelText()
        descriptionLabel.font = WLConstants.fontRegularSized(15)

        shippingRateLabel.text = product.getShippingRateText()
        shippingRateLabel.font = WLConstants.fontRegularSized(15)

        itemColorLabel.text = product.getColorText()
        itemColorLabel.font = WLConstants.fontRegularSized(15)


        var size = self.titleLabel.sizeThatFits(CGSize(width: self.titleLabel.frame.size.width, height: CGFloat.max))
        titleHeight.constant = size.height
        size = self.descriptionLabel.sizeThatFits(CGSize(width: self.descriptionLabel.frame.size.width, height: CGFloat.max))
        descriptionHeight.constant = size.height

        size = self.shippingRateLabel.sizeThatFits(CGSize(width: self.shippingRateLabel.frame.size.width, height: CGFloat.max))
        shippingRateHeight.constant = size.height

        size = self.itemColorLabel.sizeThatFits(CGSize(width: self.itemColorLabel.frame.size.width, height: CGFloat.max))
        itemColorHeight.constant = size.height
    }

    // MARK: TTTAttributeLabelDelegate

    /**
     Delegate which opens the URL in safari
     - parameter label: TTTAttributedLabel object
     - parameter didSelectLinkWithURL: the URL to open
     */
    func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        UIApplication.sharedApplication().openURL(url)
    }
}
