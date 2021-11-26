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
        //        cellView.itemImageView.downloaded(from: product.imageUrls.first ?? "")
        
        // Create URL
        let url = URL(string: product.imageUrls.first ?? "")!
        
        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.cellView.itemImageView.image = UIImage(data: data)
                }
            }
        }
    }
    override func setupViews() {
        stack(cellView)
    }
    
}
class ImageCache {
    public static let shared = Theme()

    private let cache = NSCache<NSNumber, UIImage>()

}
