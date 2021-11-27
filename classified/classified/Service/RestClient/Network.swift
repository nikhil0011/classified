//
//  Network.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//

import Foundation
import Alamofire
typealias HTTPResponse<T: Decodable> = (Result<T, GenericResponse>) -> Void
class Network {
    private static func performRequest<T: Decodable>(_ router: APIConfiguration, completion: @escaping HTTPResponse<T>) {
//        router.urlRequest?.log()
        NetworkClient.request(router).responseDecodable(of: T.self) { (response) in
//            response.response?.log(response: response)
            switch response.result {
            case let .success(value):
                DispatchQueue.main.async {
                    completion(.success(value))
                }
            case let .failure(error):
                var httpError: GenericResponse
                if let data = response.data, let parsedData = try? JSONDecoder().decode(GenericResponse.self, from: data) {
                    httpError = parsedData
                    DispatchQueue.main.async {
                        completion(.failure(httpError))
                    }
                }
            }
        }
    }
    static func listing(completion: @escaping HTTPResponse<ProductListingModel>) {
        performRequest(ListingAPIRouter.listing, completion: completion)
    }

}
