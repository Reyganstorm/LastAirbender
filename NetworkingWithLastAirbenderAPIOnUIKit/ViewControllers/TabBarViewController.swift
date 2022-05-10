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
        Task {
            do {
                avatars = try await NetworkManager.shared.fetchCharacter(from: Links.allAvatars.rawValue)
                avatarVC.avatars = avatars
            } catch {
                print(error)
            }
        }
    }
}
