//
//  RootScreen.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import Foundation

enum SideMenu: CaseIterable {
    case main
    case personalAccount
    case test
    case allAvatars
    case randomCharacters
    case exampleOne
    case exampleTwo
    case exampleThree
    case exampleFour
    case exampleFive
    case exampleSix
    case appInfo
    
    
    var titleName: String {
        switch self {
        case .main:
            return "Main"
        case .personalAccount:
            return "Account"
        case .test:
            return "What are u character?"
        case .allAvatars:
            return "All Avatars"
        case .randomCharacters:
            return "Random Character"
        case .exampleOne:
            return "not enough"
        case .exampleTwo:
            return "not enough"
        case .exampleThree:
            return "not enough"
        case .exampleFour:
            return "not enough"
        case .exampleFive:
            return "not enough"
        case .exampleSix:
            return "not enough"
        case .appInfo:
            return "About App"
        }
    }
}
