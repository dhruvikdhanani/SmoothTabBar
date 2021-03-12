//
//  BaseViewController.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import UIKit

class BaseViewController: UITabBarController {
  
  var tabController: VC_TYPE = .Dummy
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setUPColors()
  }
  
  func setUPColors() {
    if tabController == .Home {
      self.view.backgroundColor = .orange
    }
    else if tabController == .Cart {
      self.view.backgroundColor = .lightText
    }
    else if tabController == .Profile {
      self.view.backgroundColor = .magenta
    }
    else if tabController == . Menu {
      self.view.backgroundColor = .blue
    }
  }
  
  
}
