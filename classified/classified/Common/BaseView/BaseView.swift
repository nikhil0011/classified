//
//  BaseView.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit
protocol BaseViewProtocol: AnyObject {
    func setupViews()
}
class NFBaseView: UIView, BaseViewProtocol {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    // MARK: Override SetupViews in custom view
    open func setupViews() {
       
    }
}

