//
//  Extensions.swift
//  SmoothTabBar
//
//  Created by Dhruvik Dhanani on 12/03/21.
//

import Foundation
import UIKit

// Screen width.
public var screenWidth: CGFloat {
  return UIScreen.main.bounds.width
}


extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
  
  func dropShadowed(cornerRadius:CGFloat, corners: UIRectCorner, borderColor: UIColor, borderWidth:CGFloat, shadowColor:UIColor) {
      let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
      layer.mask?.shadowPath = path.cgPath
      layer.shadowColor = shadowColor.cgColor
      layer.shadowOffset = CGSize(width: -1, height: 1)
      layer.shadowOpacity = 0.5
      layer.shadowRadius = 8
      layer.cornerRadius = cornerRadius
      
      if corners.contains(.topLeft) || corners.contains(.topRight) {
          layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
      }
      if corners.contains(.bottomLeft) || corners.contains(.bottomRight) {
          layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
      }
      layer.borderColor = borderColor.cgColor
      layer.borderWidth = borderWidth
      layer.shadowPath =  nil//path.cgPath
      layer.masksToBounds = false
      layer.shouldRasterize = true
      layer.rasterizationScale = UIScreen.main.scale
  }
  
  
  var globalFrame: CGRect? {
      let rootView = UIApplication.shared.keyWindowInConnectedScenes?.rootViewController?.view
      return self.superview?.convert(self.frame, to: rootView)
  }
}

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow?{
        return windows.first(where: {$0.isKeyWindow})
    }
}

extension UIColor {
  
  /// color with hax string
  ///
  /// - Parameter hexString: hexString description
  convenience init(hexString:String) {
      var hexString:String = hexString.trimmingCharacters(in: CharacterSet.whitespaces)
      
      if (hexString.hasPrefix("#")) { hexString.remove(at: hexString.startIndex) }
      
      var color:UInt64 = 0
      Scanner(string: hexString).scanHexInt64(&color)
      
      let mask = 0x000000FF
      let r = Int(color >> 16) & mask
      let g = Int(color >> 8) & mask
      let b = Int(color) & mask
      
      let red   = CGFloat(r) / 255.0
      let green = CGFloat(g) / 255.0
      let blue  = CGFloat(b) / 255.0
      
      self.init(displayP3Red: red, green: green, blue: blue, alpha: 1)
      //self.init(red:red, green:green, blue:blue, alpha:1)
  }
  
  
  static let themeColor = UIColor(hexString: "#FF0035")
  static let themeFontColor = UIColor(hexString: "#212621")
  static let themeFontLightColor = UIColor(hexString: "#8C98A9")
}


public enum VC_TYPE:Int {
  case Dummy = 5
  case Home = 0
  case Menu = 1
  case Cart = 2
  case Profile = 3
}
