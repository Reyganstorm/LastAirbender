//
//  SideVC.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import UIKit

class SideVC: UIViewController, Routable {
    
    var router: MainRouter?
    var rootScrenn: RootScreen?
    
    var cellMenuItemArray = [
    NSLocalizedString("Main", comment: ""),
    NSLocalizedString("Account", comment: ""),
    NSLocalizedString("What are u character?", comment: ""),
    NSLocalizedString("All Avatars", comment: ""),
    NSLocalizedString("Random Character", comment: ""),
    NSLocalizedString("not enough 1", comment: ""),
    NSLocalizedString("not enough 2", comment: ""),
    NSLocalizedString("not enough 3", comment: ""),
    NSLocalizedString("not enough 4", comment: ""),
    NSLocalizedString("not enough 5", comment: ""),
    NSLocalizedString("not enough 6", comment: ""),
    NSLocalizedString("About App", comment: "")]
    
    // MARK: - Private UI Elements
    
    private let closeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "multiply.circle")
        image.tintColor = .black
        return image
    }()
    
    private let closeButton: UIButton = UIButton()
    
    private let menuTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.tintColor = .lightGray
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
//        navigationController?.navigationBar.isHidden = true
        
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        router?.navigationController.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @objc private func closeButtonDidTap() {
        dismiss(animated: true)
    }
}

extension SideVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellMenuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell
        
        let titleName = cellMenuItemArray[indexPath.row]
        cell.cellSideMenuConfigure(name: titleName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
}

extension SideVC {
    private func setupViews() {
        view.addSubview(closeImage)
        view.addSubview(closeButton)
        view.addSubview(menuTableView)
    }
    private func setupConstraints() {
        closeImage.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalToSuperview().offset(-17)
        }
        closeButton.snp.makeConstraints { make in
            make.edges.equalTo(closeImage)
        }
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(closeImage.snp.bottom).offset(10)
            make.right.equalTo(view).offset(20)
            make.left.equalTo(view)
            make.bottom.equalToSuperview()
        }
    }
}
