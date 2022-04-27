//
//  AvatarViewCell.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class AvatarViewCell: UITableViewCell {

    @IBOutlet var avatarView: CharacterImage!
    @IBOutlet var avatarNameLabel: UILabel!
    

    func configure(with avatar: Character) {
        avatarNameLabel.text =
        """
        \(avatar.name ?? "")
        \(avatar.gender ?? "")
        """
        
        avatarView.fetchImage(from: avatar.photoUrl)
        avatarView.layer.cornerRadius = avatarView.bounds.width/2
        avatarView.layer.borderWidth = 2
        avatarView.backgroundColor = .black
    }


}
