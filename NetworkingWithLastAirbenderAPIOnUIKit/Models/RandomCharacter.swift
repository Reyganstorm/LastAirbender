//
//  RandomCharacter.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import Foundation

struct Character {
    let id: String?
    
    let allies: [String]
    let enemies: [String]
    
    let photoUr: String
    let name: String
    let gender: String
    let hair: String
    
    let weapon: String
    let profession: String
    let position: String
    let affiliation: String
}
