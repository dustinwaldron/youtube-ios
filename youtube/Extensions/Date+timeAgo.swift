//
//  Date+timeAgo.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import Foundation

extension Date {
    public func timeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let string = formatter.localizedString(for: self, relativeTo: Date())
        return string
    }
}
