//
//  FontStyle.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit


public enum FontStyle {
    case type100
    case type101
    case type102
    case type120
    case type121
    case type122
    case type140
    case type141
    case type142
    case type160
    case type161
    case type162
    case type200
    case type201
    case type202
    case type240
    case type241
    case type242
    case type320
    case type321
    case type322
    case type360
    case type361
    case type362
    
    func getAttribues() -> [NSAttributedString.Key : Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        switch self {
        case .type100:
            paragraphStyle.minimumLineHeight = 12
            return [.font: Theme.shared.font.regularFont(10), .paragraphStyle: paragraphStyle]
        case .type101:
            paragraphStyle.minimumLineHeight = 12
            return [.font: Theme.shared.font.mediumFont(10), .paragraphStyle: paragraphStyle]
        case .type102:
            paragraphStyle.minimumLineHeight = 12
            return [.font: Theme.shared.font.semiboldFont(10), .paragraphStyle: paragraphStyle]
        case .type120:
            paragraphStyle.minimumLineHeight = 16
            return [.font: Theme.shared.font.regularFont(12), .paragraphStyle: paragraphStyle]
        case .type121:
            paragraphStyle.minimumLineHeight = 16
            return [.font: Theme.shared.font.mediumFont(12), .paragraphStyle: paragraphStyle]
        case .type122:
            paragraphStyle.minimumLineHeight = 16
            return [.font: Theme.shared.font.semiboldFont(12), .paragraphStyle: paragraphStyle]
        case .type140:
            paragraphStyle.minimumLineHeight = 20
            return [.font: Theme.shared.font.regularFont(14), .paragraphStyle: paragraphStyle]
        case .type141:
            paragraphStyle.minimumLineHeight = 20
            return [.font: Theme.shared.font.mediumFont(14), .paragraphStyle: paragraphStyle]
        case .type142:
            paragraphStyle.minimumLineHeight = 20
            return [.font: Theme.shared.font.semiboldFont(14), .paragraphStyle: paragraphStyle]
        case .type160:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.regularFont(16), .paragraphStyle: paragraphStyle]
        case .type161:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.mediumFont(16), .paragraphStyle: paragraphStyle]
        case .type162:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.semiboldFont(16), .paragraphStyle: paragraphStyle]
        case .type200:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.regularFont(20), .paragraphStyle: paragraphStyle]
        case .type201:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.mediumFont(20), .paragraphStyle: paragraphStyle]
        case .type202:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.semiboldFont(20), .paragraphStyle: paragraphStyle]
        case .type240:
            paragraphStyle.minimumLineHeight = 28
            return [.font: Theme.shared.font.regularFont(24), .paragraphStyle: paragraphStyle]
        case .type241:
            paragraphStyle.minimumLineHeight = 28
            return [.font: Theme.shared.font.mediumFont(24), .paragraphStyle: paragraphStyle]
        case .type242:
            paragraphStyle.minimumLineHeight = 28
            return [.font: Theme.shared.font.semiboldFont(24), .paragraphStyle: paragraphStyle]
        case .type320:
            paragraphStyle.minimumLineHeight = 36
            return [.font: Theme.shared.font.regularFont(32), .paragraphStyle: paragraphStyle]
        case .type321:
            paragraphStyle.minimumLineHeight = 36
            return [.font: Theme.shared.font.mediumFont(32), .paragraphStyle: paragraphStyle]
        case .type322:
            paragraphStyle.minimumLineHeight = 36
            return [.font: Theme.shared.font.semiboldFont(32), .paragraphStyle: paragraphStyle]
        case .type360:
            paragraphStyle.minimumLineHeight = 40
            return [.font: Theme.shared.font.regularFont(36), .paragraphStyle: paragraphStyle]
        case .type361:
            paragraphStyle.minimumLineHeight = 40
            return [.font: Theme.shared.font.mediumFont(36), .paragraphStyle: paragraphStyle]
        case .type362:
            paragraphStyle.minimumLineHeight = 40
            return [.font: Theme.shared.font.semiboldFont(36), .paragraphStyle: paragraphStyle]
        }
    }
}
