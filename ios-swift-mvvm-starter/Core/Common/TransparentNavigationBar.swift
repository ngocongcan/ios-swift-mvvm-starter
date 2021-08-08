//
//  TransparentNavigationBar.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 08/08/2021.
//

import UIKit

extension UINavigationBar {
     
    func makeTransparent() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.backgroundColor = .clear
        if #available(iOS 13.0, *) {
            self.standardAppearance.backgroundColor = .clear
            self.standardAppearance.backgroundEffect = .none
            self.standardAppearance.shadowColor = .clear
        }
    }
}
