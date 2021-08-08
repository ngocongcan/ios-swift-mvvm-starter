//
//  UserDetailViewController.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import UIKit

class UserDetailViewController: BaseUsersViewController {

    var viewModel: UsersViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        super.setupView()
        self.title = "Profile"
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.addSubview(self.refreshControl)
        self.bind(to: viewModel)
        viewModel.getUserDetail(refresh: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func handleBack(_ action: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func bind(to viewModel: UsersViewModel) {
        viewModel.selectedUser.observe(on: self) { [weak self] _ in self?.updateUser() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.refreshing.observe(on: self) { [weak self] in self?.updateRefreshing($0) }
    }
    
    private func updateUser() {
        self.tableView?.reloadData()
    }

    private func updateLoading(_ loading: Bool) {
        if (loading) {
            self.showActivityIndicator(self.view)
        } else {
            self.hideActivityIndicator()
        }
    }
    
    private func updateRefreshing(_ refreshing: Bool) {
        if (refreshing) {
            
        } else {
            super.handleRefresh(self.refreshControl)
        }
    }
    
    override func handleRefresh(_: UIRefreshControl) {
        viewModel.getUserDetail(refresh: true)
    }

}

extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileTableViewCell", for: indexPath) as? UserProfileTableViewCell {
                cell.item = viewModel.selectedUser.value
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserActivityTableViewCell", for: indexPath) as? UserActivityTableViewCell {
                cell.item = viewModel.selectedUser.value
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserBioTableViewCell", for: indexPath) as? UserBioTableViewCell {
                cell.item = viewModel.selectedUser.value
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
}

