//
//  ConfigurableCell.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//


import UIKit

public protocol ConfigurableCell: ReusableCell {
    associatedtype T

    func configure(_ item: T, at indexPath: IndexPath)
}
