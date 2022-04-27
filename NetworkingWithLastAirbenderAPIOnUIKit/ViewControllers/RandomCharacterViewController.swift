//
//  RandomCharacterViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class RandomCharacterViewController: UIViewController {
    
    @IBOutlet weak var photoImage: CharacterImage!
    @IBOutlet var textLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        description(char: character)
        photoImage.fetchImage(from: character.photoUrl)
    }
   
}

extension RandomCharacterViewController {

    
    private func description(char: Character?) {
        guard let char = char else {return}
        
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



