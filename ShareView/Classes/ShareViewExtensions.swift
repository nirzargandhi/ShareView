//
//  ShareViewExtensions.swift
//  ShareView
//
//  Created by Nirzar Gandhi on 14/05/25.
//

import Foundation
import UIKit

// MARK: - UIViewController
extension UIViewController {
    
    // Add Navigation Bottom Shadow
    func hideNavigationBottomShadow() {
        self.navigationController?.navigationBar.layer.masksToBounds = true
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.clear.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.0
    }
    
    // Get Top & Bottom bar height
    var getNavBarHeight: CGFloat {
        return (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    var getTabBarHeight: CGFloat {
        return (self.tabBarController?.tabBar.frame.size.height ?? 49.0)
    }
    
    func openActivityVC(image: UIImage) {
        
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func showAlertMessage(titleStr : String, message: String) {
        
        let alert = UIAlertController(title: titleStr, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}


// MARK: - UIView
extension UIView {
    
    func addRadiusWithBorder(radius: CGFloat = 10, border: CGFloat = 0.0) {
        
        self.layer.cornerRadius = radius
        if #available(iOS 13.0, *) {
            self.layer.cornerCurve = .continuous
        }
        self.layer.borderWidth = border
    }
    
    func getScreenshot(opaque: Bool = true, scale: CGFloat = UIScreen.main.scale, isPng: Bool = false) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, true, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if isPng, let data = screenshot?.pngData() {
            let image = UIImage(data: data)
            return image
        }
        
        return screenshot
    }
}


// MARK: - UIButton
extension UIButton {
    
    // Set BackgroundColor
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}
