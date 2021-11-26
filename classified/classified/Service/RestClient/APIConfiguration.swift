//
//  APIConfiguration.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//
import Foundation
import Alamofire
protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var host: String { get }
}
extension APIConfiguration {
    var host: String {
        SERVERBASE_URL
    }
    func returnBaseUrl() -> URL {
        URL(string: host + path) ?? URL(string: "www.google.com")!
    }
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: returnBaseUrl())
        // MARK: HTTP Method
        urlRequest.httpMethod = method.rawValue
        _ = urlRequest.setHeader()
        // MARK: Parameters
        guard method == .get else {
            if let parameters = parameters {
                do {
                    return try URLEncoding.httpBody.encode(urlRequest, with: parameters)
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
            return urlRequest
        }
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
extension URLRequest {
    mutating func setHeader() -> URLRequest {
        // MARK: Common Headers
        return self
    }
}
