//
//  Reusable.swift
//  NYTimesSample
//
//  Created by Fatih Köse on 15.02.2019.
//  Copyright © 2019 Fatih Köse. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func registerCell<T: UITableViewCell>(type: T.Type) where T: Reusable {
        self.register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
        
    }
    
    func dequeueReusableCell<T: UITableViewCell> (forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
    
}
