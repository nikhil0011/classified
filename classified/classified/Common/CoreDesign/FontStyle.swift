//
//  FontStyle.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

public enum FontStyle {
    case type202
    case type162
    case type140
    func getAttribues() -> [NSAttributedString.Key : Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        switch self {
        case .type140:
            paragraphStyle.minimumLineHeight = 20
            return [.font: Theme.shared.font.regularFont(14), .paragraphStyle: paragraphStyle]
        case .type162:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.semiboldFont(16), .paragraphStyle: paragraphStyle]
        case .type202:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.semiboldFont(20), .paragraphStyle: paragraphStyle]
        }
    }
}
