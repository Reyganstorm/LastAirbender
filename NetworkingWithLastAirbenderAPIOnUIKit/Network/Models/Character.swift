//
//  Character.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 11.09.2022.
//

import Foundation

struct Character: Codable {
    let _id: String?
    
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
