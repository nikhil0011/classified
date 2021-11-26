//
//  Styler.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit
class ListingStyler {
    enum TextStyle {
        case listingCellTitle(_ text: String)
        case listingCellSubTitle(_ text: String)
        case header(_ text: String)

    }

    struct TextAttributes {
        let font: AliasFontToken
        let color: UIColor
        let backgroundColor: UIColor?
        let text: String
        var opacity: Opacity = .opacity100
        init(text: String, font: AliasFontToken, color: UIColor, backgroundColor: UIColor? = nil, _ opacity: Opacity = .opacity100) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
            self.text = text
            self.opacity = opacity
        }
    }
    // MARK: - General Properties
    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle

    let attributesForStyle: (_ style: TextStyle) -> TextAttributes

    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes)
    {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }

    // MARK: - Convenience Getters
    func font(for style: TextStyle) -> AliasFontToken {
        return attributesForStyle(style).font
    }

    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }

    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
    func apply(textStyle: TextStyle, to label: UILabel) {
        label.numberOfLines = 0
        let attributes = attributesForStyle(textStyle)
//        label.backgroundColor = attributes.backgroundColor
        let attributedText = NSMutableAttributedString(attributedString: attributes.text.typographicText(color: attributes.color, font: attributes.font, opacity: attributes.opacity))
        label.attributedText = attributedText
    }
    func  apply(textStyle: TextStyle, to button: UIButton) {
        let attributes = attributesForStyle(textStyle)
        let attributedText = NSMutableAttributedString(attributedString: attributes.text.typographicText(color: attributes.color, font: attributes.font, opacity: attributes.opacity))
        button.setAttributedTitle(attributedText, for: .normal)
    }
}
extension UIImage {
    struct App {
        static let placeholderImage = "placeholder"
    }
}
