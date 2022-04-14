//
//  AvatarsListViewController.swift
//  NetworkingWithLastAirbenderAPIOnUIKit
//
//  Created by Руслан Штыбаев on 13.04.2022.
//

import UIKit

class AvatarsListViewController: UITableViewController {

    var avatars: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAvatars()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        avatars.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "avatars", for: indexPath) as! AvatarViewCell
        
        let persone = avatars[indexPath.row]
        
        cell.configure(with: persone)
        
        return cell
    }

    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
}

extension AvatarsListViewController {
    func fetchAvatars() {
        NetworkManager.shared.getCharacter(from: Links.allAvatars.rawValue) { result in
            switch result {
            case .success(let characters):
                print("Avatar")
                self.avatars = characters
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
