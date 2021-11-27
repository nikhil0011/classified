//
//  ItemListingViewModel.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//

import UIKit
struct ItemListingViewModel {
    let product: Product?
    var section: ListingViewController.SectionType?
    var itemHeight: CGFloat {
        162
    }
    var itemInset: UIEdgeInsets {
        .init(top: 8, left: 8, bottom: 8, right: 8)
    }
    var sectionHeaderHeigt: CGFloat {
        84
    }
    var interItemSpacing: CGFloat {
        8
    }
    var sectionInset: UIEdgeInsets {
        .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    var itemName: String? {
        product?.name.capitalized
    }
}
