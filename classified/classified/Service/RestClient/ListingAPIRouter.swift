//
//  ListingAPIRouter.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//

import Foundation
import Alamofire
enum ListingAPIRouter: APIConfiguration {
    case listing
    var method: HTTPMethod {
        switch self {
        case .listing: return .get
        }
    }
    var path: String {
        switch self {
        case .listing:
            return Endpoint.listing
        }
    }
    var parameters: Parameters? {
        switch self {
        case .listing:
            return nil
        }
    }
}
