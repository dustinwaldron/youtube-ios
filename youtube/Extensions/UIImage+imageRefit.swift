//
//  UIImage+imageRefit.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import Foundation
import UIKit

extension UIImage {
    public func imageRefit(_ desiredWidth: CGFloat) -> UIImage {
        let oldWidth = self.size.width
        let scaleFactor = desiredWidth / oldWidth

        let newHeight = self.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor

        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
