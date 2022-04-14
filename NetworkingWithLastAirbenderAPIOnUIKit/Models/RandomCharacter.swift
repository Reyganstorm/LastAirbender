//
//  RandomCharacter.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import Foundation

struct Character: Decodable {
    
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

struct Avatar: Decodable {
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
