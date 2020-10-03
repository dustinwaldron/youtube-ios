//
//  UIImageView+roundCorners.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import UIKit

extension UIImageView {
    public func roundCorners(_ radius: CGFloat = 25) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = true;
    }
}
