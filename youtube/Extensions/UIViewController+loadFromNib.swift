//
//  UIViewController+loadFromNib.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/4/20.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
