//
//  AliasFontToken.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import Foundation


public enum AliasFontToken {
    case titleMedium
    case titleSmall
    case bodyMedium
    
    func getAttribues() -> [NSAttributedString.Key : Any] {
        switch self {
        case .titleMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type202.getAttribues()
            attributes[.kern] = LetterSpacing.spacing75.rawValue
            return attributes
        case .titleSmall:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type162.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        
        case .bodyMedium:
            var attributes: [NSAttributedString.Key : Any] = FontStyle.type140.getAttribues()
            attributes[.kern] = LetterSpacing.spacing100.rawValue
            return attributes
        
        }
    }
}
