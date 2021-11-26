//
//  ProductListingModel.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import Foundation

// MARK: - Welcome
struct ProductListingModel: Codable {
    let results: [Product]?
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let key: String?
}

// MARK: - Result
struct Product: Codable {
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}
