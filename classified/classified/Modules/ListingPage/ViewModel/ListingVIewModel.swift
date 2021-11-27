//
//  ListingVIewModel.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

struct ListingViewModel {
    var bindableListingData = DualBindable<ProductListingModel, GenericResponse>()
//    var products: [Product]? {
//        fetchData()?.results
//    }
    var products: [Product]?
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
    func loadData() {
        Network.listing(completion: { (results) in
            switch results {
            case .success(let data):
                self.bindableListingData.value = data
            case .failure(let error):
                self.bindableListingData.anotherValue = error
            }
        })
    }
}
