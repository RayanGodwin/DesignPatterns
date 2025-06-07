//
//  main.swift
//  Date_Formatting
//
//  Created by Rayan Godwin Sequeira on 07/06/25.
//

import Foundation

func max_valid_date(_ input: String) -> String {
    let daysInMonth: [Int: Int] = [
        1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30,
        7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31
    ]
    
    func matchesPattern(_ candidate: String, _ pattern: String) -> Bool {
        for (c, p) in zip(candidate, pattern) {
            if p != "?" && p != c {
                return false
            }
        }
        return true
    }
    
    var maxDay = -1
    var maxMonth = -1
    
    for month in 1...12 {
        guard let maxDays = daysInMonth[month] else { continue }
        for day in 1...maxDays {
            let dd = String(format: "%02d", day)
            let mm = String(format: "%02d", month)
            let candidate = "\(dd)-\(mm)"
            
            if matchesPattern(candidate, input) {
                if month > maxMonth || (month == maxMonth && day > maxDay) {
                    maxDay = day
                    maxMonth = month
                }
            }
        }
    }

    if maxDay == -1 {
        return "xx-xx"
    } else {
        return String(format: "%02d-%02d", maxDay, maxMonth)
    }
}

print(max_valid_date("??-??"))
print(max_valid_date("1?-0?"))
print(max_valid_date("3?-0?"))
print(max_valid_date("31-0?"))
print(max_valid_date("30-02"))
print(max_valid_date("30-13"))
print(max_valid_date("??-02"))

