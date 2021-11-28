//
//  ListingProductsCollectionViewCell.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ListingProductsCollectionViewCell: BaseCollectionViewCell, ConfigurableCell {
    let styler = ListingStyler.myModule
    lazy var cellView: ListingProductCellView = ListingProductCellView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let networker = ImageLoader.shared
    var respresntedIndentifier: String = ""
    override func prepareForReuse() {
        self.cellView.itemImageView.image = nil
    }
    func configure(_ item: ItemListingViewModel, at indexPath: IndexPath) {
        guard let product = item.product else {
            return
        }
        styler.apply(textStyle: .listingCellTitle(product.name.capitalized), to: cellView.titleLabel)
        styler.apply(textStyle: .listingCellSubTitle(product.price), to: cellView.subTitleLabel)
        cellView.itemImageView.image = UIImage(named: UIImage.App.placeholderImage)
        let id = item.product?.uid ?? ""
        func image(data: Data?) -> UIImage? {
            if let data = data {
                return UIImage(data: data)
            }
            return UIImage(systemName: "picture")
        }
        networker.image(product: product) { [weak self] data, error  in
            let img = image(data: data)
            DispatchQueue.main.async {
                if (self?.respresntedIndentifier == id) {
                    self?.cellView.itemImageView.image = img
                }
            }
        }
    }
    override func setupViews() {
        stack(cellView)
    }
}
