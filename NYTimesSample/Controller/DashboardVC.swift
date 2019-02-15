//
//  DashboardVC.swift
//  NYTimesSample
//
//  Created by Fatih Köse on 15.02.2019.
//  Copyright © 2019 Fatih Köse. All rights reserved.
//

import UIKit



class DashboardVC: BaseVC {
private let refreshControl = UIRefreshControl()
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var lblNoData: UILabel!
    @IBOutlet fileprivate weak var indicatorView: UIActivityIndicatorView!
    
    var dashboardVM:DashboardVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func rightItemMorePressed() {
        super.rightItemMorePressed()
    }
    
    override func leftItemAction() {
        super.leftItemAction()
    }
    
    deinit {
        print("DashboardVC")
    }
}

extension DashboardVC {
    
    fileprivate func setupUI()
    {
        self.viewBackgroundColor = Theme.Colors.backgroundLight.color
        self.titleText = "NY Times Most Popular"
        self.viewBackgroundColor = Theme.Colors.backgroundLight.color
        self.rightButtonItemList = [.more,.search]
        
        self.dashboardVM = DashboardVM()
        self.dashboardVM.newsLoaded = { [weak self] in
            DispatchQueue.main.async {
                
                self?.tableReload()
               
            } 
        }
        
        self.dashboardVM.selectedItem = { [weak self] (item) in
            
                
                let vc = ArticleDetailVC.instantiate()
                vc.model = item
                self?.navigationController?.pushViewController(vc, animated: true)
                
            
        }
        setupTableView()
        dashboardVM.loadNews()
    }
    
    private func tableReload(){
        self.indicatorView.isHidden = true
        self.lblNoData.isHidden = self.dashboardVM.hasNews()
        self.tableView.isHidden = !self.dashboardVM.hasNews()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    private func setupTableView()
    {
        tableView.backgroundColor = Theme.Colors.backgroundLight.color
        dashboardVM.setDelegeFor(tableView)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
    }
    
    @objc private func refreshData(_ sender: Any) {
        
        self.indicatorView.isHidden = false
        dashboardVM.loadNews()
    }
    
    @IBAction func continueClicked(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DashboardVC: StoryboardInstantiable {
    static var storyboardName: String { return "Main" }
    static var storyboardIdentifier: String? { return "DashboardVC" }
}


extension DashboardVC {
    
    override func navigationSearchBarTextChange(_ searchText: String?) {
    
        dashboardVM.search(searchText)
        
    }
    
    override func navigationSearchBarEndEditing(){
        super.navigationSearchBarEndEditing()
        dashboardVM.search("")
    }
}
