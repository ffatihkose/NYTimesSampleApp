//
//  Theme.swift
//  Maximum
//
//  Created by Fatih Köse
//  Copyright © 2019 Fatih Köse. All rights reserved.
//

import UIKit
import Foundation

struct Theme {
    
    enum Colors {
        case backgroundLight
        case navigationbar
        case darkGray
        case white
        case navigationTitleColor
        case navigationBarTintColor
        
        var color: UIColor {
            switch self {
            case .backgroundLight: return UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
            case .navigationbar: return UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1.0)
            case .darkGray: return UIColor(red: 134/255, green: 134/255, blue: 134/255, alpha: 1.0)
            case .navigationTitleColor: return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            case .navigationBarTintColor: return UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1.0)
            case .white: return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            }
        }
    }
    
    enum FontBase {
        case semibold9
        case regular10
        case semibold11
        case regular12
        case medium12
        case semibold12
        case medium13
        case regular13
        case semiBold13
        case regular14
        case medium14
        case semibold14
        case regular16
        case medium16
        case semibold16
        case semibold18
        
        var font: UIFont {
            switch self {
            case .regular10: return UIFont(name: "ProximaNova-Regular", size: 10)!
            case .semibold9: return UIFont(name: "ProximaNova-Semibold", size: 9)!
            case .semibold11: return UIFont(name: "ProximaNova-Semibold", size: 11)!
            case .regular12: return UIFont(name: "ProximaNova-Regular", size: 12)!
            case .medium12: return UIFont(name: "ProximaNova-Medium", size: 12)!
            case .semibold12: return UIFont(name: "ProximaNova-Semibold", size: 12)!
            case .regular13: return UIFont(name: "ProximaNova-Regular", size: 13)!
            case .medium13: return UIFont(name: "ProximaNova-Medium", size: 13)!
            case .semiBold13: return UIFont(name: "ProximaNova-Semibold", size: 13)!
            case .regular14: return UIFont(name: "ProximaNova-Regular", size: 14)!
            case .medium14: return UIFont(name: "ProximaNova-Medium", size: 14)!
            case .semibold14: return UIFont(name: "ProximaNova-Semibold", size: 14)!
            case .regular16: return UIFont(name: "ProximaNova-Regular", size: 16)!
            case .medium16: return UIFont(name: "ProximaNova-Medium", size: 16)!
            case .semibold16: return UIFont(name: "ProximaNova-Semibold", size: 16)!
            case .semibold18: return UIFont(name: "ProximaNova-Semibold", size: 18)!
            }
        }
    }
}

