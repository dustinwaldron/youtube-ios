//
//  UIColor+rgb.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
