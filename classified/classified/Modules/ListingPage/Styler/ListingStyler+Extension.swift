//
//  ListingStyler+Extension.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//
import Foundation
extension ListingStyler {
    static var myModule: ListingStyler {
        return ListingStyler(
            backgroundColor: LColor.surface,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.moduleAttributes }
        )
    }
}

private extension ListingStyler.TextStyle {
    var moduleAttributes: ListingStyler.TextAttributes {
        switch self {
        case .listingCellTitle(let text):
            return ListingStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.primary)
        case .listingCellSubTitle(let text):
            return ListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity92)
        case .detailTitle(let text):
            return ListingStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.primary)
        case .detaillSubTitle(let text):
            return ListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity92)

        case .header(let text):
            return ListingStyler.TextAttributes(text: text, font: .titleXLarge, color: LColor.primary)
            
        }
    }
}
