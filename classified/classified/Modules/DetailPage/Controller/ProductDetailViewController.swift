//
//  ProductDetailViewController.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    let styler: ListingStyler = ListingStyler.myModule
    let viewModel: ItemListingViewModel
    lazy var detailView: ProductDetailView = ProductDetailView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    init(viewModel: ItemListingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        detailView.fillSuperview()
        setup(viewModel: viewModel)
        // Do any additional setup after loading the view.
    }
    func setup(viewModel: ItemListingViewModel?) {
        guard let model = viewModel, let item = model.product else {
            return
        }
        if let url = item.imageUrls.first {
            detailView.itemImageView.downloaded(from: url)
        }
        styler.apply(textStyle: .detailTitle(item.name), to: detailView.titleLabel)
        styler.apply(textStyle: .detaillSubTitle(item.price), to: detailView.subTitleLabel)
    }
}
