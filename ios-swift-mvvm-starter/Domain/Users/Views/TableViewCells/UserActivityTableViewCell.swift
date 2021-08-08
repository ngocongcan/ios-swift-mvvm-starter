//
//  UserActivityTableViewCell.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 08/08/2021.
//

import UIKit

class UserActivityTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lbFollowers : UILabel!
    @IBOutlet weak var lbFollowings : UILabel!
    @IBOutlet weak var lbRepos : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbFollowers.numberOfLines = 2
        lbFollowings.numberOfLines = 2
        lbRepos.numberOfLines = 2
    }
    
    var item: User! {
        didSet {
            self.lbFollowers.text = "\(item.followers ?? 0) \n Followers"
            self.lbFollowings.text = "\(item.following ?? 0) \n Followings"
            self.lbRepos.text = "\(item.public_repos ?? 0) \n Repos"
        }
    }
}
