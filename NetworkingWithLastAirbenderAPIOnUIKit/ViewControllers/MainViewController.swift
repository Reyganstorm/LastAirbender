//
//  ViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import UIKit

let link = "https://last-airbender-api.herokuapp.com/api/v1/characters/random"

class MainViewController: UIViewController {
    
    var character = Character.getCharacter()
    
    @IBOutlet var photoView: UIImageView!
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        character = Character.getCharacter()
    }
    
    
    
    @IBAction func getRandomCharacter() {
        fetchCharacter()
        character = Character.getCharacter()
    }
    
}

extension MainViewController {
    private func fetchCharacter() {
        guard let char = character else {return}
        guard let characterUrl = URL(string: char.photoUrl ?? "" ) else { return }
        guard let photoImage = try? Data(contentsOf: characterUrl) else { return }
        
        DispatchQueue.main.async {
            self.firstLabel.text =
                                """
                                name: \(String(char.name ?? ""))
                                gender: \(String(char.gender ?? ""))
                                hair: \(String(char.hair ?? ""))
                                love: \(String(char.love ?? "unknown"))
                                """
            self.secondLabel.text =
                                """
                                allies: \(String(char.allies?.description ?? ""))
                                enemies: \(String(char.enemies?.description ?? ""))
                                """
            
            self.thirdLabel.text =
                                """
                                weapon: \(String(char.weapon ?? ""))
                                profession: \(String(char.profession ?? ""))
                                position: \(String(char.position ?? ""))
                                affiliation: \(String(char.affiliation ?? ""))
                                """
            self.photoView.image = UIImage(data: photoImage)
        }
        
    }
}
