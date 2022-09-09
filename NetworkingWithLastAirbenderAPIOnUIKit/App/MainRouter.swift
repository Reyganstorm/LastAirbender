//
//  MainRouter.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 09.09.2022.
//

import Foundation
import UIKit

protocol Routable: UIViewController {
    var router: MainRouter { get set }
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
    
    
}
