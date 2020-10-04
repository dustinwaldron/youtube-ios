//
//  UIBarButtonItem+menuButton.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

extension UIBarButtonItem {

    static func menuButton(_ target: Any?, action: Selector, imageName: String, size: CGFloat, tintColor: UIColor) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.tintColor = tintColor
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: size).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: size).isActive = true
        menuBarItem.tintColor = tintColor

        return menuBarItem
    }
}
