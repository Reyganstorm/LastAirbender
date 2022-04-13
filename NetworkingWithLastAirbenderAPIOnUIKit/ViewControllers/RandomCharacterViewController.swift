//
//  RandomCharacterViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class RandomCharacterViewController: UIViewController {
    
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    var character: [Character]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage(char: character)
        description(char: character)
    }
   
}

extension RandomCharacterViewController {
     func fetchImage(char: [Character]) {
         let character = char[0]
         NetworkManager.shared.fetchImage(from: character.photoUrl) { result in
             switch result {
             case .success(let imageData):
                 
                 self.photoImage.image = UIImage(data: imageData)
             case .failure(let error):
                 self.textLabel.text = error.localizedDescription
             }
         }
     }
    
    private func description(char: [Character]) {
        let char = char[0]
        self.textLabel.text =
        """
        name: \(String(char.name ?? ""))
        gender: \(String(char.gender ?? ""))
        hair: \(String(char.hair ?? ""))
        love: \(String(char.love ?? "unknown"))
        allies: \(String(char.allies?.description ?? ""))
        enemies: \(String(char.enemies?.description ?? ""))
        weapon: \(String(char.weapon ?? ""))
        profession: \(String(char.profession ?? ""))
        position: \(String(char.position ?? ""))
        affiliation: \(String(char.affiliation ?? ""))
        """
    }
    
}



