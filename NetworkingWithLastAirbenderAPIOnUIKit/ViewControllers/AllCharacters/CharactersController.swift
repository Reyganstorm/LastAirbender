//
//  CharactersController.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import UIKit

class CharactersController: BaseVC {

    private let frontView: UIView = {
       let view = UIView()
//        view.backgroundColor = .red
        return view
    }()
    
    private var baseView: CharactersView = CharactersView()

    private var allCharacters = [Character]()
    private var totalCount = 0
    private let pageSize = 20
    private var page = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.charactersTableView.dataSource = self
        baseView.charactersTableView.delegate = self
        
        fetchAllCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFrontView()
    }
    
    
    private func setupFrontView() {
        view.addSubview(frontView)
        frontView.addSubview(baseView)
        
        frontView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.right.bottom.equalToSuperview()
        }
        
        baseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func fetchAllCharacters() {
        showLoadingIndicator()
        AllCharactersAPI.getChatacters(perPage: pageSize, page: page) { characters, statusCode in
            print(statusCode)
            self.page += 1
            self.allCharacters += characters
            
            self.baseView.charactersTableView.reloadData()
            self.dismissLoadingIndicator()
        }
    }
}

extension CharactersController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as! CharactersTableViewCell
        let character = allCharacters[indexPath.row]
        cell.configure(character: character)
        
        
        if indexPath.row == allCharacters.count - 1 {
            
            fetchAllCharacters()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
