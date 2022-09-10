//
//  MenuTableViewCell.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 10.09.2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuCell"
    
    // MARK: - UI Elements
    
    private let itemCellLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupViews() {
        addSubview(itemCellLabel)
    }
    
    private func setupConstraints() {
        itemCellLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(11)
            make.left.equalToSuperview().offset(36)
        }
    }
    
    // MARK: - Public functions
    
    func cellSideMenuConfigure(name: String) {
        itemCellLabel.text = name
    }
}
