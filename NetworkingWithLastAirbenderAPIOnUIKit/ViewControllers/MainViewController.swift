//
//  ViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import UIKit

let link = "https://last-airbender-api.herokuapp.com/api/v1/characters/random"

class MainViewController: UIViewController {
    
 //   private var character = NetworkManager.shared.getCharacter(link: link)
    
    @IBOutlet var photoView: UIImageView!
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func getRandomCharacter() {
        
        fetchCharacter()
    }
    
}

extension MainViewController {
    private func fetchCharacter() {
    
        guard let url = URL(string: link) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
                
                do {
                    let character = try JSONDecoder().decode([Character].self, from: data)
                    guard let singleCharacter: Character = character.first else {return }
                    guard let characterUrl = URL(string: singleCharacter.photoUrl ?? "" ) else { return }
                    guard let photoImage = try? Data(contentsOf: characterUrl) else { return }
                    DispatchQueue.main.async {
                        self.firstLabel.text =
                                """
                                name: \(String(singleCharacter.name ?? ""))
                                gender: \(String(singleCharacter.gender ?? ""))
                                hair: \(String(singleCharacter.hair ?? ""))
                                love: \(String(singleCharacter.love ?? "unknown"))
                                """
                        self.secondLabel.text =
                                """
                                allies: \(String(singleCharacter.allies?.description ?? ""))
                                enemies: \(String(singleCharacter.enemies?.description ?? ""))
                                """
                        
                        self.thirdLabel.text =
                                """
                                weapon: \(String(singleCharacter.weapon ?? ""))
                                profession: \(String(singleCharacter.profession ?? ""))
                                position: \(String(singleCharacter.position ?? ""))
                                affiliation: \(String(singleCharacter.affiliation ?? ""))
                                """
                        self.photoView.image = UIImage(data: photoImage)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }.resume()
  
        
        
    }
}
