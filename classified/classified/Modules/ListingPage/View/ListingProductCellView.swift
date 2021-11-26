//
//  ListingProductCellView.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ListingProductCellView: BaseView {
    lazy var titleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
    }
    lazy var subTitleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    lazy var itemImageView: UIImageView = UIImageView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
    }
    let outerView: UIView = UIView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
  
    override func setupViews() {
        addSubview(outerView)
        outerView.fillSuperview()
        outerView.addSubViews(itemImageView, titleLabel, subTitleLabel)
        itemImageView.anchor(top: self.outerView.topAnchor, left: self.outerView.leftAnchor, bottom: nil, right: nil, width: 96, height: 128)
        titleLabel.anchor(top: self.outerView.topAnchor, left: self.itemImageView.rightAnchor, bottom: nil, right: self.outerView.rightAnchor, paddingLeft: 12)
        subTitleLabel.anchor(top: self.titleLabel.bottomAnchor, left: self.itemImageView.rightAnchor, bottom: nil, right: self.outerView.rightAnchor, paddingTop: 4, paddingLeft: 12)
        self.itemImageView.withBorder(width: 1, color: LColor.primary.alpha(with: .opacity12))
    }
}
