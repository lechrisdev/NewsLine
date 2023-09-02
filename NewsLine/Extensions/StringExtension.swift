//
//  StringExtension.swift
//  NewsLine
//
//  Created by Le Chris on 02.09.2023.
//

import Foundation

extension String {
    static func relativeDateString(fromTimestamp timestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    static func formattedDateString(fromTimestamp timestamp: TimeInterval) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM yyyy"
            
            let date = Date(timeIntervalSince1970: timestamp)
            return dateFormatter.string(from: date)
        }
    
}

// Примеры использования
//let timestamp: TimeInterval = 1648809255
//let relativeDate = String.relativeDateString(fromTimestamp: timestamp)
//let formattedDate = String.formattedDateString(fromTimestamp: timestamp)
//
//print(relativeDate) // Напечатает, например, "2 дня назад"
//print(formattedDate) // Напечатает, например, "31 March 2023"

