//
//  MainController.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 09.09.2022.
//

import Foundation
import UIKit

class MainController: UIViewController, Routable {
    var router: MainRouter?
    
    var baseView: MainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .orange
        baseView.frame = view.bounds
    }
    
    
}
