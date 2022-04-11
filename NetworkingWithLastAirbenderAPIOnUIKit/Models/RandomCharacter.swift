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
    func getCharacter(link: String) -> Character? {
        var trueCharacter: Character?
        let url = URL(string: link)!
            
        URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
                
                do {
                    let character = try JSONDecoder().decode([Character].self, from: data)
                        guard let singleCharacter: Character = character.first else {return }
                       trueCharacter = singleCharacter
  //                      guard let characterUrl = URL(string: singleCharacter.photoUrl ?? "" ) else { return }
 //                       guard let photoImage = try? Data(contentsOf: characterUrl) else { return }
//                        DispatchQueue.main.async {
//                            self.firstLabel.text = """
//                            name: \(String(singleCharacter.name ?? ""))
//                            gender: \(String(singleCharacter.gender ?? ""))
//                            hair: \(String(singleCharacter.hair ?? ""))
//                            love: \(String(singleCharacter.love ?? "unknown"))
//                            """
//                            self.secondLabel.text = """
//                            allies: \(String(singleCharacter.allies?.description ?? ""))
//                            enemies: \(String(singleCharacter.enemies?.description ?? ""))
//                            """
//
//                            self.thirdLabel.text = """
//                            weapon: \(String(singleCharacter.weapon ?? ""))
//                            profession: \(String(singleCharacter.profession ?? ""))
//                            position: \(String(singleCharacter.position ?? ""))
//                            affiliation: \(String(singleCharacter.affiliation ?? ""))
//                            """
//                            self.photoView.image = UIImage(data: photoImage)
 //                       }
                } catch let error {
                    print(error.localizedDescription)
                }

            }.resume()
        return trueCharacter
    }

    
}
