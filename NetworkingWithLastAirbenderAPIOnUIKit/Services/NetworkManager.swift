//
//  NetworkManager.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}


class NetworkManager {
    static let shared = NetworkManager()
    
    var character: [Character] = []
    
    func getCharacter(from stringUrl: String, with completion: (Result<Character, NetworkError>)) -> Void {
        
        guard let url = URL(string: stringUrl) else { completion(.failure(.invalis)) }
        
        
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

    
    init() {}
}
