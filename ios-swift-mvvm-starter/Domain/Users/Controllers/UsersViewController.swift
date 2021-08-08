//
//  UsersViewController.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//
import UIKit

class UsersViewController: BaseUsersViewController {

    var viewModel: UsersViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        super.setupView()
        self.title = "User List"
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.addSubview(self.refreshControl)
        self.bind(to: viewModel)
        self.viewModel.viewDidLoad()
        self.viewModel.getData(refresh: false)
    }
    
    private func bind(to viewModel: UsersViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.refreshing.observe(on: self) { [weak self] in self?.updateRefreshing($0) }
    }
    
    private func updateItems() {
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
        self.viewModel.getData(refresh: true)
    }

}

extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell {
            cell.item = viewModel.item(at: indexPath.row)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let detailVc = UsersModule.createUserDetailVC() as? UserDetailViewController {
            viewModel.selectedUser.value = viewModel.item(at: indexPath.row)
            detailVc.viewModel = viewModel
            self.navigationController?.pushViewController(detailVc, animated: true)
        }
        
    }
}

