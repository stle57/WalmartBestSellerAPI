//
//  WLProductViewController.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

/**
WLPoductViewController class handles the communication between data model and views.  It tells the views
** to load data and draw the views for each of the items within the collection view
*/

class WLProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let identifier = "wlProductCell"
    let headerViewIdentifier = "CategoryHeaderView"
    
    @IBOutlet weak var collectionView: UICollectionView!

    /**
     Contains data from the Walmart API organized by Category
     */
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Get data from WLAPIClient
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - UICollectionViewDataSource Delegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.categories.count
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.categories[section].products?.count)!
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("wlProductCell", forIndexPath: indexPath) as! WLProductCollectionCell
        let products: [Product] = self.categories[indexPath.section].products!

        cell.productLabel.text = products[indexPath.row].name
        cell.productLabel.font = WLConstants.fontSemiBoldSized(11)
        cell.productLabel.textColor = UIColor.blueColor()
        WLAPIClient.fetchImage(products[indexPath.row].thumbnailURL!){ image in
            cell.imageView.image = image
        }

        return cell
    }

    //segue to WLProductDetailViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProductDetail" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath

            let vc = segue.destinationViewController as! WLProductDetailViewController
            //vc.title = self.categories[indexPath.section].products![indexPath.row].name
            vc.product = self.categories[indexPath.section].products![indexPath.row]
         }
    }

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        let headerView: WLCategoryHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerViewIdentifier, forIndexPath: indexPath) as! WLCategoryHeaderView

        headerView.categorySectionLabel.text = self.categories[indexPath.section].name
        headerView.categorySectionLabel.font = WLConstants.fontBoldSized(22)
        return headerView
    }

    /**
     Method loads best seller products and reloads the collection view
     with data.
     */
    func loadData() {
        WLAPIClient.sharedInstance.loadBestSellerProducts{[weak self] (items) in
            self?.categories = items
            self?.collectionView.reloadData()
        }
    }

    /**
     The method gets the Products associated to the Category object
     - parameter index: The category item
     - Returns: An array of Products for the specific Category item
     */
    func getProductItems(index: Int) -> [Product] {
        let items = self.categories[index].products

        return items!
    }
}

