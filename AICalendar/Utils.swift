//
//  Utils.swift
//  AICalendar
//
//  Created by Arthur Sanchez on 1/19/25.
//

import SwiftUI

func getFirstDayOfMonthName(_ dateComponents: DateComponents) -> String {
    // Returns the string Day of the given Month EX: 'Thursday'

    var newComponents = dateComponents
    newComponents.day = 1
    
    // Create date from components
    let firstDayOfMonth = calendar.date(from: newComponents)
    let firstDayOfMonthName = firstDayOfMonth!.formatted(.dateTime.weekday(.wide))

    return firstDayOfMonthName
}

func getDayName(dayNum: Int, monthNum: Int, year: Int) -> String {
    let dateComponents = DateComponents(year: year, month: monthNum, day: dayNum)
    let day = calendar.date(from: dateComponents)
    let dayName = day!.formatted(.dateTime.weekday(.wide))
    
    return dayName
}

func getNumOfDaysToOffset(_ firstDayOfMonthName: String, _ dayNames: [String]) -> Int {
    // Returns amount of days to offset calendar in order to put first day of Calendar
    // EX: First day of the month is Friday, Calendar is offsetted so that the days before friday of first week are blank
    var daysOffset = 0
    for dayName in dayNames {
        if firstDayOfMonthName == dayName {
            break
        }
        daysOffset -= 1
    }
    return daysOffset
}

func getMonthNumOfDays(monthNum: Int, year: Int) -> Int {
    let dateComponents = DateComponents(year: year, month: monthNum)
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!

    let range = calendar.range(of: .day, in: .month, for: date)!
    let numDays = range.count
    
    return numDays
}
