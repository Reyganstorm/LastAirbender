//
//  ViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import UIKit

class ForRandomButtonsViewController: UIViewController {
    private var character: [Character]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let randomCharVC = segue.destination as? RandomCharacterViewController
        else {return}
        randomCharVC.character = character
    }
    
    @IBAction func getRandomCharacter() {
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        fetchCharacter()
    }
}


extension ForRandomButtonsViewController {
    private func fetchCharacter() {
        NetworkManager.shared.getCharacter(from: Links.random.rawValue) { result in
            switch result {
            case .success(let character):
                self.character = character
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

