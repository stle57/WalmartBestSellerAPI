//
//  WLProductDetailViewController.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit


/**
 WLProductDetailSections is an Enum describing each section of the UICollectionView
*/
enum WLProductDetailSections : Int {
    // Just set the first one to = 0 if order changes. each following auto-increment
    case Image = 0
    case Description
    case Details
}

/**
WLProductDetailViewController draws each view within the UICollectionView
Each section in the UICollectionView represents some description of the product
given to the view by the model(Product).  The UICollectionView contained within
the controller is divided up into 3 sections, referenced by the WLProductDetailSections
*/
class WLProductDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    var product : Product?
    var imageURL : String?

    lazy var cellReuser : CollectionViewCellReuse = {
        return CollectionViewCellReuse(collectionView: self.collectionView, cells: ["WLProductImageCell", "WLProductDescriptionCell", "WLProductDetailsCell"])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .Center
        label.text = product?.name
       label.textColor = UIColor.blueColor()
        label.font = WLConstants.fontSemiBoldSized(16)
        label.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        label.sizeToFit()
        label.text = product?.name
        label.numberOfLines = 0
        self.navigationItem.titleView = label

        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - UICollectionViewDelegate
    */

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if self.product == nil {
            return 0
        } else {
            // 1: Preview Image
            // 2: Description
            // 3: Details
            return 3
        }
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let sect = WLProductDetailSections(rawValue: section) {
            switch sect {
            case .Image:
                return 1
            case .Description:
                return 1
            case .Details:
                return 1
            }
        }
        return 0
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell!

        if let sect = WLProductDetailSections(rawValue: indexPath.section) {
            switch sect {
            case .Image:
                cell = self.cellReuser.getReusableCellForIdentifier("WLProductImageCell", indexPath: indexPath)
                CollectionViewCellSetup.wlProductImageCell(cell, product: self.product!)
            case .Description:
                cell = self.cellReuser.getReusableCellForIdentifier("WLProductDescriptionCell", indexPath: indexPath)
                CollectionViewCellSetup.wlProductDescriptionCell(cell, product: self.product!)
            case .Details:
                cell = self.cellReuser.getReusableCellForIdentifier("WLProductDetailsCell", indexPath: indexPath)
                CollectionViewCellSetup.wlProductURLCell(cell, product: self.product!)
           }
        }

        // This will crash the app if section is not covered, but it should be.
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout

    /** 
    Calculates the size of each section
    */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if let sect = WLProductDetailSections(rawValue: indexPath.section) {
            switch sect {
            case .Image:
                return WLProductImageCell.sizeForItem()
            case .Description:
                return WLProductDescriptionCell.sizeForItem(self.product!)
            case .Details:
                return WLProductDetailsCell.sizeForItem(self.product!)
            }
        }
        return CGSize(width: 0, height: 0)
    }

}