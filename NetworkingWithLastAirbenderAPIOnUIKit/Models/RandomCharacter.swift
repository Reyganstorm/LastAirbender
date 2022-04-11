//
//  RandomCharacter.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import Foundation

struct Character: Decodable {
 //   let id: String?
    
    let allies: [String]?
    let enemies: [String]?
    
    let photoUrl: String?
    let name: String?
    let gender: String?
    let hair: String?
    
    let love: String?
    
    let weapon: String?
    let profession: String?
    let position: String?
    let affiliation: String?
}

extension Character {
    static func getCharacter() -> Character? {
        NetworkManager.shared.getCharacter(from: Links.random.rawValue).first
    }
}
