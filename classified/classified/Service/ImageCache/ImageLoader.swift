//
//  ImageLoader.swift
//  classified
//
//  Created by Nikhil Nangia on 27/11/21.
//
import Foundation
import UIKit
enum NetworkManagerError: Error {
    case badResponse(URLResponse?)
    case badData
    case badLocalUrl
}
public final class ImageLoader {
    private let cache: ImageCacheType
    static var shared = ImageLoader()
    let session: URLSession
    
    init(cache: ImageCacheType = ImageCache()) {
        self.cache = cache
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    private func download(imageURL: URL, completion: @escaping (Data?, Error?) -> (Void)) {
        if let imageData = cache[imageURL] {
            completion(imageData as Data, nil)
            return
        }
        DispatchQueue.global(qos: .utility).async { [weak self] in
            let task = self?.session.downloadTask(with: imageURL) { localUrl, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completion(nil, NetworkManagerError.badResponse(response))
                    return
                }
                guard let localUrl = localUrl else {
                    completion(nil, NetworkManagerError.badLocalUrl)
                    return
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    do {
                        let data = try Data(contentsOf: localUrl)
                        self?.cache.insertImage(data, for: imageURL)
                        completion(data, nil)
                    }catch let error {
                        completion(nil, error)
                    }
                }
            }
            task?.resume()
        }
    }
    
    func image(product: Product, completion: @escaping (Data?, Error?) -> (Void)) {
        if let url = URL(string: product.imageUrls.first ?? "") {
            download(imageURL: url, completion: completion)
        }
    }
}
