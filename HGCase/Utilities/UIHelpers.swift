//
//  UIHelpers.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import Foundation
import UIKit

enum UIHelpers {
    static func createTwoColumnFlowLayout(in view:UIView)->UICollectionViewFlowLayout{
        
        
        let width                    = view.bounds.width
        let padding:CGFloat          = width * 0.05
        let minimumItemSpace:CGFloat = width * 0.034
        let availableWidth           = width - (padding * 2) - (minimumItemSpace * 2)
        let itemWidth                = availableWidth / 2
        let flowLayout               = UICollectionViewFlowLayout()
        flowLayout.scrollDirection   = .vertical
        
    
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth   , height: itemWidth*1.13)
        return flowLayout
    }
}
