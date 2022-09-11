//
//  BaseAPI.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import Foundation
import Alamofire

class ServiceAPI {
    
    static func fetchJSONData<T: Codable>(from url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping (T, Int) -> ()) {
    
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding).responseString { response in
            
            
            switch response.result {
            case .success(_):
                let statusCode = response.response?.statusCode
                if let json = response.data {
                    let string = NSString(data: json, encoding: String.Encoding.utf8.rawValue)
                    print("Response - \(url): \(string ?? "")")
                    
                    let decoder = JSONDecoder()
                    let data = json as Data
                    let result = try! decoder.decode(T.self, from: data)
                    
                    completion(result, statusCode!)
                }
            case .failure( let error):
                return print("\(error)", response.response?.statusCode ?? 0)
            }
        }
    }
    
}
