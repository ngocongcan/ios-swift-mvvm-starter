//
//  UserBioTableViewCell.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 08/08/2021.
//

import UIKit

class UserBioTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lbBioTitle : UILabel!
    @IBOutlet weak var lbBioContent : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lbBioContent.numberOfLines = 100
    }
    
    var item: User! {
        didSet {
            self.lbBioTitle.text = "Bio"
            self.lbBioContent.text = item.bio
        }
    }
}
