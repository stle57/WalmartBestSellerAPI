//
//  WLConstants.swift
//  WalmartUICollectionView
//
//  Created by Stephanie Le on 12/11/16.
//  Copyright © 2016 Stephanie Le. All rights reserved.
//

import Foundation
import UIKit

class WLConstants {

    // #MARK - Fonts

    static func fontLightSized(size: Int) -> UIFont {
        return UIFont(name: "ProximaNova-Light" , size: CGFloat(size))!
    }

    static func fontRegularSized(size: Int) -> UIFont {
        return UIFont(name: "ProximaNova-Regular" , size: CGFloat(size))!
    }

    static func fontSemiBoldSized(size: Int) -> UIFont {
        return UIFont(name: "ProximaNova-SemiBold" , size: CGFloat(size))!
    }

    static func fontBoldSized(size: Int) -> UIFont {
        return UIFont(name: "ProximaNova-Bold" , size: CGFloat(size))!
    }
}
