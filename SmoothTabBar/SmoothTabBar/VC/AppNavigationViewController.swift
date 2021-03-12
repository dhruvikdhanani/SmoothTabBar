//
//  AppNavigationViewController.swift
//  SmoothTabBar
//
//  Created by DREAMS on 29/09/20.
//

import UIKit

class AppNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .themeFontColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
}
