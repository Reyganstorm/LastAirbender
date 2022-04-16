//
//  TabBarViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    var avatars: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewController()
    }
    
    private func loadViewController() {
        guard let avatarVC = self.viewControllers?.last as? AvatarsListViewController else { return }
        
        NetworkManager.shared.getCharacter(from: Links.allAvatars.rawValue) { result in
            switch result {
            case .success(let character):
                DispatchQueue.main.async {
                    self.avatars = character
                    avatarVC.avatars = self.avatars
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
