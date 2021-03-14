//
//  DashboardViewController.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import UIKit

class AppTabBarViewController: UITabBarController {
  
  let tabBarView:SmoothTabBarView = UIView.fromNib()
  var tabData:[TabItem] = [TabItem]()
  
  convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, smoothData:[TabItem]) {
    self.init(nibName: nibNameOrNil, bundle: nil)
    self.tabData = smoothData
    tabBarView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: tabBar.frame.height)
    tabBarView.setupData(tabData: tabData)
    self.tabBar.addSubview(tabBarView)
    self.viewControllers = setTab()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
  
  func setTab() -> [UIViewController] {
      var vc: [UIViewController] = []
      for tab in tabData {
        if vc.count < 5 {
          vc.append(tab.storyboardName)
        } else {
          let alert = UIAlertController(title: "Alert", message: "You can not add more than 5 view controller", preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
        }
      }
      return vc
  }
  
  func selection()  {
    if let item = tabBarView.viewWithTag(100) as? SmoothTabItemView {
      tabBarView.leadingConstraint.constant = item.globalFrame!.minX
      tabBarView.widthConstraint.constant = item.frame.width
        item.btnTabAction()
    }
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
    selection()
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
