//
//  ViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import UIKit

let link = "https://last-airbender-api.herokuapp.com/api/v1/characters/random"

class ForRandomButtonsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func getRandomCharacter() {
       
        
    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
     }
}


extension ForRandomButtonsViewController {
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let randomCharVC = segue.destination as? RandomCharacterViewController
        else {return}
    NetworkManager.shared.getCharacter(from: Links.random.rawValue) { result in
        switch result {
        case .success(let character):
            self.successAlert()
            randomCharVC.character = character
        case .failure(let error):
            print(error)
            self.failedAlert()
        }
    }
    }
    
    
    // MARK: - Alert Controller
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
    }
    
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
       //     present(alert, animated: true)
        }
    }
}

/*
extension ForRandomButtonsViewController {
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
 */
