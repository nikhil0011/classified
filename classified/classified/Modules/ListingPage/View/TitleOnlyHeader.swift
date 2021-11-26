//
//  TitleOnlyHeaderCollectionReusableView.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class TitleOnlyHeader: UICollectionReusableView, ReusableCell {
    let styler: ListingStyler = ListingStyler.myModule
  
    lazy var titleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setupViews() {
        stack(titleLabel).withMargins(.init(top: 16, left: 20, bottom: 40, right: 20))
    }
    func configure() {
        styler.apply(textStyle: .header("Products"), to: titleLabel)
    }
}
