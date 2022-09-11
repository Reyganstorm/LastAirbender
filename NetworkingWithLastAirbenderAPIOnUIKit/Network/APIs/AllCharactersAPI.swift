//
//  AllCharacters.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 11.09.2022.
//

import Foundation
import Alamofire

struct AllCharactersAPI {
    static func getChatacters(perPage: Int, page: Int, completion: @escaping([Character],Int) -> ()) {
        
        let url = URLs.characters + "?perPage=\(perPage)" + "&page=\(page)"
        
        ServiceAPI.fetchJSONData(from: url, completion: completion)
    }
}
