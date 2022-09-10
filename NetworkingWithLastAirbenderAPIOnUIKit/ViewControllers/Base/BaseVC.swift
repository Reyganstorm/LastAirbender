//
//  BaseVC.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import UIKit
import SideMenu

class BaseVC: UIViewController, Routable {
    
    var router: MainRouter?
    let sideMenuVC = SideVC()
    
    // MARK: - UI elements
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mainBack")
        return imageView
    }()
    
    private let sideMenuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "line.3.horizontal.circle")
        imageView.tintColor = .black
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let sideMenuButton: UIButton = UIButton()
    
    private let personalAccountImage: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(systemName: "person.circle.fill")

        imageView.tintColor = .black
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let personalAccountButton: UIButton = UIButton()
    
    private let appNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Last Airbender"
        label.font = UIFont(name: "QwitcherGrypen-Bold", size: 50)
        label.textAlignment = .center
        label.tintColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: -
    
    private let blurView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        setupViews()
        setupConstraints()
        personalAccountButton.addTarget(self, action: #selector(personalAccountDidTap), for: .touchUpInside)
        sideMenuButton.addTarget(self, action: #selector(sideMenuDidTap), for: .touchUpInside)
    }
    
    // MARK: - Private @objc methods
    
    @objc func sideMenuDidTap() {
        sideMenuVC.router = router
        let menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        menu.leftSide = false
        menu.menuWidth = 260
        router?.navigationController.present(menu, animated: true, completion: nil)
    }
    
    @objc func personalAccountDidTap() {
        print("personalAccountDidTap")
    }
    
}

extension BaseVC: SideMenuNavigationControllerDelegate {
    private func blurBackgroundOn() {
        view.addSubview(blurView)
        view.bringSubviewToFront(sideMenuImage)
        view.bringSubviewToFront(appNameLabel)
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func blurBackgroundOff() {
        blurView.removeFromSuperview()
    }
    
    private func blurViewIsHidden() -> Bool {
        if view.subviews.contains(blurView) {
            return false
        } else {
            return true
        }
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        blurBackgroundOn()
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        blurBackgroundOff()
    }
}


extension BaseVC {
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(sideMenuImage)
        view.addSubview(sideMenuButton)
        view.addSubview(personalAccountImage)
        backgroundImageView.addSubview(appNameLabel)
        view.addSubview(personalAccountButton)
    }
    
    
    private func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        sideMenuImage.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalTo(appNameLabel)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-17)
        }
        
        sideMenuButton.snp.makeConstraints { make in
            make.edges.equalTo(sideMenuImage)
        }
        
        personalAccountImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 40, height: 40))
            make.centerY.equalTo(appNameLabel)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(17)
        }
        personalAccountButton.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(personalAccountImage)
        }
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(personalAccountButton).offset(5)
            make.right.equalTo(sideMenuButton).offset(-5)
        }
    }
}
