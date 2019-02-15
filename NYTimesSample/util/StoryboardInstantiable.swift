//
//  StoryboardInstantiable.swift
//  NYTimesSample
//
//  Created by Fatih Köse on 15.02.2019.
//  Copyright © 2019 Fatih Köse. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInstantiable {
    
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
}

extension StoryboardInstantiable {
    
    static var storyboardIdentifier: String? { return nil }
    static var storyboardBundle: Bundle? { return nil }
    
    static func instantiate() -> Self {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        
        if let storyboardIdentifier = storyboardIdentifier {
            return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        } else {
            return storyboard.instantiateInitialViewController() as! Self
        }
    }
}
