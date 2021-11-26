//
//  CollectionDataProvider.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

public protocol CollectionDataProvider {
    associatedtype T

    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> T?

    func updateItem(at indexPath: IndexPath, value: T)
}
