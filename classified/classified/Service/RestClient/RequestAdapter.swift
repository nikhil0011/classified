//
//  RequestAdapter.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
import Alamofire
import Foundation

final class CustomRequestAdapter: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
//        guard urlRequest.url?.absoluteString.hasPrefix(SERVERBASE_URL) == true else {
//            /// If the request requires authentication, we can directly return it as unmodified.
//            return completion(.success(urlRequest))
//        }
        completion(.success(urlRequest))
    }
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            /// The request did not fail due to a 401 Unauthorized response.
            /// Return the original error and don't retry the request.
            return completion(.doNotRetryWithError(error))
        }
        completion(.doNotRetryWithError(error))
    }
}
