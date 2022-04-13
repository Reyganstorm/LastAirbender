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
    
    // MARK: - func fetchImage
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        do {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    
    // MARK: - func fetchAvatars
    func fetchAvatars(from url: String?, with completion: @escaping(Result<[Avatar], NetworkError>)-> Void) {
        guard let stringUrl = URL(string: url ?? "") else { return
            completion(.failure(.invalidURL))
        }
        
        URLSession.shared.dataTask(with: stringUrl) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let avatars = try JSONDecoder().decode([Avatar].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(avatars))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }
    }
    
    
    init() {}
}
