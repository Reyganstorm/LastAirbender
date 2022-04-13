//
//  AvatarViewCell.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class AvatarViewCell: UITableViewCell {

    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var avatarNameLabel: UILabel!
    @IBOutlet var nationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with avatar: Avatar) {
        avatarNameLabel.text = avatar.name
        
        NetworkManager.shared.fetchImage(from: avatar.photoURL) { result in
            switch result {
            case .success(let imageAvatar):
                self.avatarView.image = UIImage(data: imageAvatar)
            case .failure(let error):
                print(error)
            }
        }
    }

}
