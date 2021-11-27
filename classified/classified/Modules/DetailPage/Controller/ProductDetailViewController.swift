//
//  ProductDetailViewController.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    let networker = ImageLoader.shared
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
        self.title = viewModel.itemName ?? "Product Detail"
        self.view.addSubview(detailView)
        detailView.fillSuperview()
        setup(viewModel: viewModel)
    }
    func setup(viewModel: ItemListingViewModel?) {
        guard let model = viewModel, let item = model.product else {
            return
        }
        styler.apply(textStyle: .detailTitle(model.itemName ?? ""), to: detailView.titleLabel)
        styler.apply(textStyle: .detaillSubTitle(item.price), to: detailView.subTitleLabel)
        func image(data: Data?) -> UIImage? {
            if let data = data {
                return UIImage(data: data)
            }
            return UIImage(systemName: "picture")
        }
        networker.image(product: item) { [weak self] data, error  in
            let img = image(data: data)
            DispatchQueue.main.async {
                self?.detailView.itemImageView.image = img
            }
        }
    }
}
