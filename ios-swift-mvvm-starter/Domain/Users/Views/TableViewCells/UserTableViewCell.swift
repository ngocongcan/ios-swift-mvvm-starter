//
//  UserTableViewCell.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//


import UIKit

class UserTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lbName : UILabel!
    @IBOutlet weak var lbHtmlUrl : UILabel!
    @IBOutlet weak var ivAvatar : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ivAvatar.layer.masksToBounds = true
        self.ivAvatar.layer.cornerRadius = self.ivAvatar.frame.height / 2.0
    }
    
    var item: User! {
        didSet {
            self.ivAvatar.cacheSetImage(urlString: item.avatar_url, imageMode: .scaleAspectFill)
            self.lbName.text = item.login
            self.lbHtmlUrl.text = item.html_url
        }
    }
}
