//
//  SmoothTabItemView.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import UIKit

class SmoothTabItemView: UIView {
 
    @IBOutlet weak var tabImageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var leadingImageContraint: NSLayoutConstraint!
    var clickTabItem:((Int)->Void)?
    var tabItem:TabItem?
    
    func setupData(tabItem:TabItem) {
        self.tabItem = tabItem 
        tabImageView.image = tabItem.image
        lblTitle.text = tabItem.tabName
      lblTitle.textColor = .themeColor
        if self.tag == 100 {
            lblTitle.isHidden = false
            tabImageView.tintColor = .themeColor
        } else {
            lblTitle.isHidden = true
            tabImageView.tintColor = .themeFontColor
        }
    }
    
    func btnTabAction() {
        guard let click = self.clickTabItem else { return }
        click(self.tag)
    }
    
}

class TabItem {
    
  var storyboardName: UIViewController!
  var image: UIImage?
  var tabName:String?
  
  init(_ storyboardName: UIViewController, imageName: String,  tabName: String) {
    self.storyboardName = storyboardName
    self.image = UIImage(named: imageName)
    self.tabName = tabName
  }
}
