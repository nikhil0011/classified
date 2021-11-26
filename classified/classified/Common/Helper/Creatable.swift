//
//  Creatable.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

protocol Creatable: UIView {
    init()
}

extension Creatable {
    static func create(_ builder: (Self) -> Void) -> Self {
        let view = Self.init()
        builder(view)
        return view
    }
    
    func configure(_ modifier: (Self) -> Void) -> Self {
        modifier(self)
        return self
    }
}

extension UIView: Creatable {}
