//
//  UIViewController_SpinnerView_Extension.swift
//  BoubyanTechAssesment
//
//  Created by elsaid yousif on 02/02/2022.
//

import Foundation
import NVActivityIndicatorView
import UIKit
import SwiftMessages

extension UIViewController {
    //display loading indicator function
    class func displaySpinner(onView : UIView) -> UIView {
        let loaderColor = UIColor.green
        let animationFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100))
        let animationView = NVActivityIndicatorView(frame: animationFrame, type: NVActivityIndicatorType.ballScaleMultiple, color:loaderColor, padding: 10)
        DispatchQueue.main.async {
            animationView.center = onView.center
            onView.addSubview(animationView)
        }
        animationView.startAnimating()
        return animationView
    }
    //remove loading indicator function
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    //show error message notification for user
     func showErrorMessage(message:String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.error)
        view.bodyLabel?.font = UIFont(name: "Cairo-SemiBold", size: 15)
        // Add a drop shadow.
        //view.configureDropShadow()
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        // Set message title, body, and icon. Here, we're overriding the default warning
        // image with an emoji character.
        let iconText = [""].randomElement()!
        view.configureContent(title: " ", body: message, iconText: iconText)
    
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: .normal)
        config.dimMode = .blur(style: .dark, alpha: 0.5, interactive: true)
        // Show the message.
        
        SwiftMessages.show(config: config, view: view)
    }
}
