//
//  ListingVIewModel.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

struct ListingViewModel {
    var products: [Product]? {
        fetchData()?.results
    }
    func fetchData() -> ProductListingModel? {
        loadJson(filename: "dubizzle")
    }
    func loadJson(filename fileName: String) -> ProductListingModel? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ProductListingModel.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
struct ItemListingViewModel {
    let product: Product?
    var section: ListingViewController.SectionType?
    var itemHeight: CGFloat {
        162
    }
    var itemInset: UIEdgeInsets {
        .init(top: 8, left: 8, bottom: 8, right: 8)
    }
    var sectionHeaderHeigt: CGFloat {
        94
    }
    var interItemSpacing: CGFloat {
        8
    }
    var sectionInset: UIEdgeInsets {
        .init(top: 0, left: 20, bottom: 0, right: 20)
    }
}
