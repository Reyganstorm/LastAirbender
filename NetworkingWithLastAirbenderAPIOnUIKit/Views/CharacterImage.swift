//
//  CharacterImage.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 26.04.2022.
//

import UIKit

class CharacterImage: UIImageView {
    
    func fetchImage(from url: String?) {
        guard let url = URL(string: url ?? "") else {
            image = UIImage(named: "anonim")
            return}
        
        // Используем изображение из кеша если оно там есть
        if let cashedImage = getCache(from: url) {
            image = cashedImage
            return
        }
        
        // Вызываем картинку и сохраняем в кеш
        ImageManager.shared.fetchImage(from: url) { data, response in
            self.image = UIImage(data: data)
            self.postCache(with: data, and: response)
        }
    }
   
    private func postCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cashedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cashedResponse, for: request)
    }
    
    private func getCache(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
