//
//  TabBarViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    var avatars: [Avatar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewController()
    }
    
    
    
    
    private func loadViewController() {
        guard let avatarVC = self.viewControllers?.last as? AvatarsListViewController else { return }
        avatarVC.fetchAvatars()
    }
    
//    private func setupViewControllers() {
//        fetchAvatars()
//        let avatarsVC = viewControllers?.last as! AvatarsListViewController
//        avatarsVC.avatars = avatars
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
