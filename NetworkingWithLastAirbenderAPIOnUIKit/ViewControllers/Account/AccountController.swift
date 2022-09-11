//
//  AccountController.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import UIKit

class AccountController: BaseVC {

    private let frontView: UIView = {
       let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFrontView()
    }
    
    
    private func setupFrontView() {
        view.addSubview(frontView)
//        frontView.addSubview(baseView)
        
        frontView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.right.bottom.equalToSuperview()
        }
        
//        baseView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }

}
