//
//  NetworkClient.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//

import Foundation
import Alamofire
import Foundation
final class NetworkClient {
    let session: Session

    private init() {
        let manager = ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [:])
        
        self.session = Session(
            interceptor: CustomRequestAdapter(),
            serverTrustManager: manager
        )
    }
    // MARK: - Static Definitions
    private static let shared = NetworkClient()
    static func request(_ convertible: URLRequestConvertible) -> DataRequest {
        let request = shared.session.request(convertible)
        return request.validate(statusCode: 200..<401).validate(contentType: [ContentType.json.rawValue, ContentType.text.rawValue])
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case userAgent = "x-user-agent"
}
enum ContentType: String {
    case json = "application/json"
    case text = "text/html"
}
