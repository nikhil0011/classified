//
//  ReusableCell.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//


import UIKit

public protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
