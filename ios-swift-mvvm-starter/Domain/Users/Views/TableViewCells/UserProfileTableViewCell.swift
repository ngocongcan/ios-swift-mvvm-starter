//
//  UserProfileTableViewCell.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 08/08/2021.
//

import UIKit

class UserProfileTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lbName : UILabel!
    @IBOutlet weak var lbLocation : UILabel!
    @IBOutlet weak var ivAvatar : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ivAvatar.layer.masksToBounds = true
        self.ivAvatar.layer.cornerRadius = self.ivAvatar.frame.height / 2.0
        self.ivAvatar.layer.borderWidth = 5
        self.ivAvatar.layer.borderColor = UIColor.white.cgColor
    }
    
    var item: User! {
        didSet {
            self.ivAvatar.cacheSetImage(urlString: item.avatar_url, imageMode: .scaleAspectFill)
            self.lbName.text = item.name
            self.lbLocation.text = item.location
        }
    }
}
