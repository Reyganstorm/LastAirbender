//
//  NetworkManager.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    
    var character: [Character] = []
    
    func getCharacter(from urlLink: String) -> [Character] {
        if let url = URL(string: urlLink) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
                do {
                    self.character = try JSONDecoder().decode([Character].self, from: data)
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }.resume()
        }
        return character
    }
    
    init() {}
}
