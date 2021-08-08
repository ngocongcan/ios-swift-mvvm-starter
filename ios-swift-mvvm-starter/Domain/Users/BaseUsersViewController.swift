//
//  BaseUsersController.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import UIKit

class BaseUsersViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView?

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(BaseUsersViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.init(red: 35.0/255, green: 133.0/255, blue: 192.0/255, alpha: 1)
        return refreshControl
    }()
    
    @objc func handleRefresh(_ :UIRefreshControl) {
        // refresh here
        refreshControl.endRefreshing()
    }
    
    func loadMore() {}
    
    override func setupView() {
        super.setupView()
//        self.refreshControl.tintColor = GPTheme.style().refreshControlTinColor()
    }

}
