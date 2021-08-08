//
//  BaseViewController.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//


import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        
    }
    
}

extension BaseViewController {
    
    func showActivityIndicator(_ inView : UIView? = nil){
        guard let mView = inView else {
            ViewControllerUtils().showActivityIndicator(uiView: self.view)
            return
        }
        ViewControllerUtils().showActivityIndicator(uiView: mView)
    }
    
    func hideActivityIndicator(_ fromView : UIView? = nil){
        guard let mView = fromView else {
            ViewControllerUtils().hideActivityIndicator(uiView: self.view)
            return
        }
        ViewControllerUtils().hideActivityIndicator(uiView: mView)
    }
}


import Foundation
import UIKit

class LoadingContainerView: UIView {
    
}

class ViewControllerUtils {
    
    var container: UIView = LoadingContainerView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     
     @param uiView - add activity indicator to this view
     */
    func showActivityIndicator(uiView: UIView) {
        var frame = uiView.frame
        frame.origin = CGPoint.init(x: 0, y: frame.origin.y * -1)
        container.frame = frame
        container.backgroundColor = UIColor.init(white: 1.0, alpha: 0.2)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.init(white: 200/255.0, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x:0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.tintColor = UIColor.init(red: 35.0/255, green: 133.0/255, blue: 192.0/255, alpha: 1)
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        uiView.bringSubviewToFront(container)
        activityIndicator.startAnimating()
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     @param uiView - remove activity indicator from this view
     */
    func hideActivityIndicator(uiView: UIView) {
        for subView in uiView.subviews {
            if let subView = subView as? LoadingContainerView {
                subView.removeFromSuperview()
            }
        }
    }
}

