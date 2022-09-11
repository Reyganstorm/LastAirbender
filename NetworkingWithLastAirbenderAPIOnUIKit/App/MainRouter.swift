//
//  MainRouter.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 09.09.2022.
//

import Foundation
import UIKit

protocol Routable: UIViewController {
    var router: MainRouter? { get set }
}

enum RootScreen {
    case main
    case personalPage
    case avatars
    case random
    case allCharacters
}

class MainRouter: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: true)
        self.navigationController = navigationController
    }
    
    // MARK: - PUSH ViewController
    
    func pushMainVC() {
        let mainVC = MainController()
//        mainVC.router = self
        pushViewController(vc: mainVC, animated: false)
    }
    
    func pushWithActionAccountVC() {
        let vc = AccountController()
        pushViewController(vc: vc, animated: true)
    }
    
    func pushWithoutActionAccountVC() {
        let vc = AccountController()
        pushViewController(vc: vc, animated: true)
    }
    
    func pushAllCharactersVC() {
        let vc = CharactersController()
        pushViewController(vc: vc, animated: false)
    }
    
    func pushTestVC() {
        let vc = TestController()
        pushViewController(vc: vc, animated: false)
    }
    
    func pushAllAvatars() {
        let vc = AllAvatarsController()
        pushViewController(vc: vc, animated: false)
    }
    
    func pushRandomCharacters() {
        let vc = RandomCharactersController()
        pushViewController(vc: vc, animated: false)
    }
    
    
    // MARK: - Private Func
    
    private func pushViewController(vc: Routable, animated: Bool) {
        vc.router = self
        navigationController.pushViewController(vc, animated: animated)
    }
}
