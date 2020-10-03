//
//  String+toDate.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/3/20.
//

import Foundation

extension String {
  func toDate(dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let date: Date? = dateFormatter.date(from: self)
        return date
    }
}
