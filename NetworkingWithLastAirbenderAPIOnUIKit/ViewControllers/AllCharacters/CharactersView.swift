//
//  CharactersView.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import Foundation
import UIKit

class CharactersView: UIView {
    
    let charactersTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
        return tableView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(charactersTableView)
    }
    
    private func addConstraints() {
        
        charactersTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
