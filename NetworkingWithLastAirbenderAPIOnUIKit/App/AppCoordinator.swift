//
//  AppCoordinator.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 09.09.2022.
//

import Foundation
import UIKit


class AppCoordinator: NSObject {
    var window: UIWindow
    var router: MainRouter?
    
    init(window: UIWindow?) {
        self.window = window!
        super.init()
        startScreenFlow()
    }
    
    func didFinishLaunchingWithOptions(_ aplication: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? ) {
        
    }
    
    private func startScreenFlow() {
        let navController = UINavigationController()
        router = MainRouter(navigationController: navController)
        router?.pushMainVC()
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
    }
}
