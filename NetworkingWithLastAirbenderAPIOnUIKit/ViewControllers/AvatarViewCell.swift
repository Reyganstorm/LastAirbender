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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
