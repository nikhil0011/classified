//
//  Color.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//
import UIKit

public protocol Color {
    var primary : UIColor {get}
    var secondary : UIColor {get}
    var surface : UIColor {get}
}
extension UIColor {
    func alpha(with opacity: Opacity) -> UIColor {
        self.withAlphaComponent(opacity.rawValue)
    }
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
