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
        case .coloumnAttributeTitle(let text):
            return ListingStyler.TextAttributes(text: text, font: .buttonSmall, color: LColor.primary, .opacity92)
        }
    }
}
