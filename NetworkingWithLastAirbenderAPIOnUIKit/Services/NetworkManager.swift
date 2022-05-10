//
//  NetworkManager.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import Foundation

enum Links: String {
    case random = "https://last-airbender-api.herokuapp.com/api/v1/characters/random"
    case allAvatars = "https://last-airbender-api.herokuapp.com/api/v1/characters/avatar"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    // MARK: - func getCharacter
    func getCharacter(from stringUrl: String?,with completion: @escaping(Result<[Character], NetworkError>) -> Void) {
        guard let url = URL(string: stringUrl ?? "") else { return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let characterData = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characterData))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchCharacter(from stringUrl: String?) async throws -> [Character] {
        guard let url = URL(string: stringUrl ?? "") else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let courses = try? JSONDecoder().decode([Character].self, from: data) else {
            throw NetworkError.noData
        }
        
        return courses
    }
    
    private init() {}
}


    // MARK: - ImageManager
class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL,
                    with completion: @escaping(Data, URLResponse) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "Error no description")
                return
            }
            
            guard url == response.url else {return}
            
            DispatchQueue.main.async {
                completion(data, response)
            }
            
        }.resume()
    }
}
