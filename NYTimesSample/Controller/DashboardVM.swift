//
//  DashBoardVM.swift
//  NYTimesSample
//
//  Created by Fatih Köse on 15.02.2019.
//  Copyright © 2019 Fatih Köse. All rights reserved.
//

import Foundation
import UIKit

class DashboardVM: NSObject {
    
   var newsLoaded = {() -> () in }
    
    var selectedItem = {(_ item:Result) -> () in }
    
    fileprivate var nyMostPopolarNews: Welcome?{
        didSet{
            filteredNews = nyMostPopolarNews?.results
        }
    }
    
    fileprivate var filteredNews : [Result]?{
        didSet{
            newsLoaded()
        }
    }

    func hasNews()->Bool{
        
        guard let filtered = filteredNews else { return false }
        return filtered.count != 0
    }

    deinit {
        print("DashboardVM deinit")
    }
}

extension DashboardVM {
    
    func setDelegeFor(_ tableView:UITableView)
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 131
        tableView.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: "NYTNewsItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NYTNewsItemCell")
    }
}



extension DashboardVM : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let _ = nyMostPopolarNews else { return 0 }
        return filteredNews!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = filteredNews![indexPath.row]
        
         let cell:NYTNewsItemCell = tableView.dequeueReusableCell(withIdentifier: "NYTNewsItemCell") as! NYTNewsItemCell
         cell.update(item)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell: NYTNewsItemCell = tableView.cellForRow(at: indexPath) as! NYTNewsItemCell
        
        selectedItem(cell.newsModel)
    }
    
    func reload(_ tableView:UITableView, at index:IndexPath) {
        tableView.reloadRows(at: [index], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DashboardVM {
    
    func search(_ text : String?){
        
        guard let welcome = nyMostPopolarNews else { return  }
        
        if (text ?? "").isEmpty{
            filteredNews = welcome.results
            return
        }
        
        filteredNews = welcome.results.filter {$0.title.contains(text!)}
    }
    
}

extension DashboardVM {
    
    func loadNews()
    {
        
        Network.instance.request(params: [:], section: "all-sections", dayType: "7") { [weak self] (result : Welcome) in
            self?.nyMostPopolarNews = result
        }
    }
    
}
