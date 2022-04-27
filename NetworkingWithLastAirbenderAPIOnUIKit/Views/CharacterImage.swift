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
        
        ImageManager.shared.fetchImage(from: url) { data, response in
            self.image = UIImage(data: data)
        }
    }
    // Используем изображение из кеша если оно там есть
    
    // Вызываем картинку и сохраняем в кеш
}
