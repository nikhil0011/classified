//
//  ProductDetailView.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ProductDetailView: BaseView {
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
        $0.image = UIImage(named: UIImage.App.placeholderImage)
    }
    let outerView: UIView = UIView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
  
    override func setupViews() {
        backgroundColor = LColor.surface
        addSubview(outerView)
        outerView.fillSuperview(padding: .init(top: 32, left: 20, bottom: 20, right: 20))
        outerView.addSubViews(itemImageView, titleLabel, subTitleLabel)
        itemImageView.anchor(top: self.outerView.topAnchor, left: self.outerView.leftAnchor, bottom: nil, right: self.outerView.rightAnchor, height: 300)
        titleLabel.anchor(top: self.itemImageView.bottomAnchor, left: self.outerView.leftAnchor, bottom: nil, right: self.outerView.rightAnchor, paddingTop: 12)
        subTitleLabel.anchor(top: self.titleLabel.bottomAnchor, left: self.outerView.leftAnchor, bottom: nil, right: self.outerView.rightAnchor, paddingTop: 4)
        self.itemImageView.withBorder(width: 1, color: LColor.primary.alpha(with: .opacity12))
    }
}
