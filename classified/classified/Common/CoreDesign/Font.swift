//
//  Font.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import Foundation
import UIKit

public protocol Font {
    func regularFont(_ size : CGFloat) -> UIFont
    func mediumFont(_ size : CGFloat) -> UIFont
    func semiboldFont(_ size : CGFloat) -> UIFont
}

public struct GlobalFontToken: Font {
    public func regularFont(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
        
    public func mediumFont(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    public func semiboldFont(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}

