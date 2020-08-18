//
//  DateFormmater.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 21.06.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class CustomDateFormatter {
    // MARK: - Properties
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM d, h:mm a"
        return df
    }()
    
    // MARK: - Methods
    static func toString(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    static func toDate(from str: String) -> Date {
        return dateFormatter.date(from: str) ?? Date()
    }
    
//    static func getMonthName(from date: Date) -> String {
//        let df = DateFormatter()
//        df.dateFormat = "LLLL"
//        return df.string(from: date)
//    }
    
    static func getShortMonthName(from date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "MMM"
        return df.string(from: date)
    }
    
    static func getTime(from date: Date) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return "\(hour):\(minutes)"
    }
    
}
