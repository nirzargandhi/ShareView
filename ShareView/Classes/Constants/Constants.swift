//
//  Constants.swift
//  ShareView
//
//  Created by Nirzar Gandhi on 14/05/25.
//

import Foundation
import UIKit

let BASEWIDTH = 375.0
let SCREENSIZE: CGRect      = UIScreen.main.bounds
let SCREENWIDTH             = UIScreen.main.bounds.width
let SCREENHEIGHT            = UIScreen.main.bounds.height
let WINDOW                  = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let STATUSBARHEIGHT         = WINDOW?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
var NAVBARHEIGHT            = 44.0

let APPDELEOBJ              = UIApplication.shared.delegate as! AppDelegate

struct Constants {
    
    struct Storyboard {
        
        static let Main = "Main"
    }
    
    struct Generic {
        
        static let IMAGE_GENERATE_ERROR = "Image cannot be generated. Please try again"
    }
}
