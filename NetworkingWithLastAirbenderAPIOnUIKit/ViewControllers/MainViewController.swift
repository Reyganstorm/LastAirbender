//
//  ViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 11.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var character: Character?
    
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


extension MainViewController {
    private func fetchCharacter() {
        Task {
            do {
                let characters = try await NetworkManager.shared.fetchCharacter(from: Links.random.rawValue)
                character = characters.first
            } catch {
                print(error)
            }
        }
    }
}

