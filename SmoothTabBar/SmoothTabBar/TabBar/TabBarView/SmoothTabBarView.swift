//
//  SmoothTabBar.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import UIKit

class SmoothTabBarView: UIView {

    @IBOutlet weak var tabStackView: UIStackView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    func setupData(tabData:[TabItem]) {
        for i in 0..<tabData.count {
            let view:SmoothTabItemView = UIView.fromNib()
            view.tag = i+100
            view.clickTabItem = {[weak self] (id) in
                UIView.animate(withDuration: 0.5) { [weak self] in
                    self?.leadingConstraint.constant = view.globalFrame!.minX
                    self?.widthConstraint.constant = view.frame.width
                    
                    for j in 0..<tabData.count {
                        if let vwTAG = self?.viewWithTag(j+100) as? SmoothTabItemView {
                            if id == j+100 {
                                vwTAG.leadingImageContraint.constant = 0
                                vwTAG.lblTitle.isHidden = false
                                vwTAG.tabImageView.tintColor = .themeColor
                            } else {
                                vwTAG.leadingImageContraint.constant = (view.frame.width/2)-4
                                vwTAG.lblTitle.isHidden = true
                                vwTAG.tabImageView.tintColor = .themeFontColor
                            }
                        }
                    }
                    self?.layoutIfNeeded()
                } 
            }
            view.setupData(tabItem: tabData[i])
            tabStackView.addArrangedSubview(view)
        }
    }
    
}
