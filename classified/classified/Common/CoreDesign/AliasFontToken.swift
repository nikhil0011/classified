//
//  AliasFontToken.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import Foundation


public enum AliasFontToken {
    case titleXLarge
    case titleLarge
    case titleMedium
    case titleSmall
    case titleXSmall
    case subtitleLarge
    case subtitleMedium
    case subtitleSmall
    case bodyLarge
    case bodyMedium
    case bodySmall
    case bodyXSmall
    case buttonLarge
    case buttonMedium
    case buttonSmall
    case labelMedium
    case labelSmall

    func getAttribues() -> [NSAttributedString.Key : Any] {
        switch self {
        case .titleXLarge:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type322.getAttribues()
            attributes[.kern] = LetterSpacing.spacing50.rawValue
            return attributes
        case .titleLarge:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type242.getAttribues()
            attributes[.kern] = LetterSpacing.spacing50.rawValue
            return attributes
        case .titleMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type202.getAttribues()
            attributes[.kern] = LetterSpacing.spacing75.rawValue
            return attributes
        case .titleSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type162.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        case .titleXSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type142.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        case .subtitleLarge:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type161.getAttribues()
            attributes[.kern] = LetterSpacing.spacing75.rawValue
            return attributes
        case .subtitleMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type141.getAttribues()
            attributes[.kern] = LetterSpacing.spacing75.rawValue
            return attributes
        case .subtitleSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type121.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        case .bodyLarge:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type160.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        case .bodyMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type140.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        case .bodySmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type120.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        case .bodyXSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type100.getAttribues()
            attributes[.kern] = LetterSpacing.spacing200.rawValue
            return attributes
        case .buttonLarge:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type162.getAttribues()
            attributes[.kern] = LetterSpacing.spacing200.rawValue
            return attributes
        case .buttonMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type142.getAttribues()
            attributes[.kern] = LetterSpacing.spacing200.rawValue
            return attributes
        case .buttonSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type122.getAttribues()
            attributes[.kern] = LetterSpacing.spacing200.rawValue
            return attributes
        case .labelMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type122.getAttribues()
            attributes[.kern] = LetterSpacing.spacing400.rawValue
            return attributes
        case .labelSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type102.getAttribues()
            attributes[.kern] = LetterSpacing.spacing500.rawValue
            return attributes
        }
    }
}
