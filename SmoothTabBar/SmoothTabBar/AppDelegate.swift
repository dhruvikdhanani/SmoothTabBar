//
//  AppDelegate.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    showDashboard()
    return true
  }
  
  func showDashboard() {
    let tab = AppTabBarViewController.init(nibName: "AppTabBarViewController", bundle: nil)
    let navigation = UINavigationController.init(rootViewController: tab)
    window?.rootViewController = navigation
    window?.makeKeyAndVisible()
  }
  
}

