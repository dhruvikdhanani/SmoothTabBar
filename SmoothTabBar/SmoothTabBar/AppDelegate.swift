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
      let dashboard = AppTabBarViewController.init(nibName: "AppTabBarViewController", bundle: nil,smoothData: smoothTab())
      let navigation = UINavigationController.init(rootViewController: dashboard)
      window?.rootViewController = navigation
      window?.makeKeyAndVisible()
  }
  
  func smoothTab() -> [TabItem] {
    let v1 = ViewController()
    v1.tabController = .Home
    let v2 = ViewController()
    v2.tabController = .Menu
    let v3 = ViewController()
    v3.tabController = .Cart
    let v4 = ViewController()
    v4.tabController = .Profile
    
    
    let t1 = TabItem(v1, imageName: "for_you", tabName: "Pizza")
    let t2 = TabItem(v2, imageName: "order", tabName: "Order")
    let t3 = TabItem(v3, imageName: "cart", tabName: "Cart")
    let t4 = TabItem(v4, imageName: "profile", tabName: "Profile")
    
    return [t1,t2,t3,t4]
  }


}

