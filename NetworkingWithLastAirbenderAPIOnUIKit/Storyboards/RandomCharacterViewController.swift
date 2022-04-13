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
    
    func description(char: [Character]) {
        let character = char[0]
        textLabel.text =
        """
        name: \(String(character.name ?? ""))
        gender: \(String(character.gender ?? ""))
        hair: \(String(character.hair ?? ""))
        love: \(String(character.love ?? "unknown"))
        """
        
    }
}
