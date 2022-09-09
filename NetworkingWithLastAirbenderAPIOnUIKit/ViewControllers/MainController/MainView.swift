//
//  MainView.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 09.09.2022.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "Last Airbender"
        label.font = .systemFont(ofSize: 22)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func addViews() {
        addSubview(background)
        background.addSubview(label)
    }
    
    private func addConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
