//
//  Int+withCommas.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import Foundation

extension Int {

    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    internal var withCommas: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
