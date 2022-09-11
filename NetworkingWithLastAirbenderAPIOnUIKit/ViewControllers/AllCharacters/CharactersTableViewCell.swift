//
//  CharactersTableViewCell.swift
//  LastAirbender
//
//  Created by Руслан Штыбаев on 11.09.2022.
//

import UIKit
import SDWebImage

class CharactersTableViewCell: UITableViewCell {
    
    static let identifier = "AllCharactersCell"
    
    // MARK: - UI Elements
    
    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let backViewGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [UIColor(red: 1, green: 0.61, blue: 0.38, alpha: 1),
                           UIColor(red: 0.76, green: 0.81, blue: 0.9, alpha: 1)]
        return gradient
    }()
    
    private let imagePhotoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderColor = .init(red: 230/255, green: 234/255, blue: 246/255, alpha: 1)
        imageView.layer.borderWidth = 1.5
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let affilationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBackViewGradient()
        setupViews()
        setupConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backViewGradient.frame = bounds
    }
    
    // MARK: - Private functions
    private func setupViews() {
        contentView.addSubview(backView)
        backView.addSubview(imagePhotoView)
        backView.addSubview(nameLabel)
        backView.addSubview(affilationLabel)
    }

    private func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.edges.equalToSuperview()
        }
        
        imagePhotoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(imagePhotoView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-5)
        }
        
        affilationLabel.snp.makeConstraints { make in
            make.left.right.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Public functions
    
    func configure(character: Character) {
        self.nameLabel.text = character.name
        self.affilationLabel.text = character.affiliation
        
        guard let imageUrl = URL(string: character.photoUrl ?? "") else { return }
        self.imagePhotoView.sd_setImage(with: imageUrl)
    }
}

extension CharactersTableViewCell {
    private func setupBackViewGradient() {
        backViewGradient.startPoint = CGPoint(x: 0, y: 0)
        backViewGradient.endPoint = CGPoint(x: 1, y: 1)
        backViewGradient.frame = bounds
        backViewGradient.cornerRadius = 16
        layer.addSublayer(backViewGradient)
    }
}
