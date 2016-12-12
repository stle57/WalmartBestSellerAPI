//
//  WLProductViewController.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/10/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import UIKit

class WLProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let identifier = "wlProductCell"
    let headerViewIdentifier = "CategoryHeaderView"
    
    @IBOutlet weak var collectionView: UICollectionView!
    var allItems = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()

        //Get data from WLAPIClient
        loadData()
        //Load the data

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - UICollectionViewDataSource Delegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.allItems.count
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("all items count=" + String(self.allItems.count))
        //Needs to be category[idx].product.count
        return (self.allItems[section].products?.count)!
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("wlProductCell", forIndexPath: indexPath) as! WLProductCollectionCell
        let products: [Product] = self.allItems[indexPath.section].products!

        cell.productLabel.text = products[indexPath.row].name
        cell.productLabel.font = WLConstants.fontSemiBoldSized(11)

        WLAPIClient.fetchImage(products[indexPath.row].thumbnailURL!){ image in
            cell.imageView.image = image
        }

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProductDetail" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath

            let vc = segue.destinationViewController as! WLProductDetailViewController
            vc.title = self.allItems[indexPath.section].products![indexPath.row].name
            vc.product = self.allItems[indexPath.section].products![indexPath.row]
         }
    }

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        let headerView: WLCategoryHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerViewIdentifier, forIndexPath: indexPath) as! WLCategoryHeaderView

        headerView.categorySectionLabel.text = self.allItems[indexPath.section].name
        headerView.categorySectionLabel.font = WLConstants.fontBoldSized(22)
        return headerView
    }

    func loadData() {
        WLAPIClient.sharedInstance.hello()
        WLAPIClient.sharedInstance.loadBestSellerProducts{[weak self] (items) in
            self?.allItems = items
            self?.collectionView.reloadData()
        }
    }

    func getProductItems(index: Int) -> [Product] {
        let items = self.allItems[index].products

        return items!
    }
}

