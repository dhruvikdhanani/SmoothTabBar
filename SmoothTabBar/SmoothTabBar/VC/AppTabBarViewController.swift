//
//  AppTabBarViewController.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import UIKit

class AppTabBarViewController: UITabBarController {
  
  let tabBarView:SmoothTabBarView = UIView.fromNib()
  var tabData:[TabItem] = [TabItem]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    UITabBar.appearance().tintColor = UIColor.themeColor
    tabBarView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: tabBar.frame.height)
    
    let home1 = BaseViewController.init(nibName: "BaseViewController", bundle: nil)
    home1.tabController = .Home
    tabData.append(TabItem(imageName: "for_you", tabName: "Pizza"))
    
    let home2 = BaseViewController.init(nibName: "BaseViewController", bundle: nil)
    home2.tabController = .Menu
    tabData.append(TabItem(imageName: "order", tabName: "Order"))
    
    let home3 = BaseViewController.init(nibName: "BaseViewController", bundle: nil)
    home3.tabController = .Cart
    tabData.append(TabItem(imageName: "cart", tabName: "Cart"))
    
    let home4 = BaseViewController.init(nibName: "BaseViewController", bundle: nil)
    home4.tabController = .Profile
    tabData.append(TabItem(imageName: "profile", tabName: "Profile"))
    
    tabBarView.setupData(tabData: tabData)
    self.tabBar.addSubview(tabBarView)
    viewControllers = [home1, home2, home3, home4]
  }
  
  func selectedIndexWithAnimation(index:Int) {
    self.selectedIndex = index
    if let item = tabBarView.viewWithTag(index+100) as? SmoothTabItemView {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        item.btnTabAction()
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.tabBar.backgroundColor = .clear
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()
    self.tabBarView.dropShadowed(cornerRadius: 16, corners: [.topRight,.topLeft], borderColor: UIColor.clear, borderWidth: 0, shadowColor: .themeFontLightColor)
  }
}

extension AppTabBarViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    if let item = tabBarView.viewWithTag(tabBarController.selectedIndex+100) as? SmoothTabItemView {
      item.btnTabAction()
    }
  }
}
