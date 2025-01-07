//
//  Calendar.swift
//  AI-Calendar
//
//  Created by Arthur Sanchez on 12/24/24.
//
import SwiftUI

struct Event: Identifiable {
    let id: Int = UUID().hashValue
    let title: String = "New Task"
    let description: String = ""
//    let start: Date? = Date()
//    let end: Date? = Date()
}

func getFirstDayOfMonthName(_ date: Date, _ dayNames: [String]) -> (String, Int) {
    // Returns the string Day of the given Month EX: 'Thursday'
    
    let calendar = Calendar(identifier: .gregorian)
    var dateComponents = DateComponents()
    
    dateComponents.timeZone = TimeZone(abbreviation: "PST")
    dateComponents.year = calendar.component(.year, from: date)
    dateComponents.month = 11
    dateComponents.day = 1

    // Create date from components
    let firstDayOfMonth = calendar.date(from: dateComponents)
    let firstDayOfMonthName = firstDayOfMonth!.formatted(.dateTime.weekday(.wide))

    var daysOffset = 1
    for dayName in dayNames {
        if firstDayOfMonthName == dayName {
            break
        }
        daysOffset -= 1
    }
    

    return (firstDayOfMonthName, daysOffset)
    
    
}

func DisplayCalendar(currMonth: Date) {
    
}

func createEvent(event: Event) {
    
}

func initializeCalendar(month:Int, firstMonthDayName: String) -> [Day] {
    var days = [Day]()
    for dayNum in 1...32 {
        let dayOfWeekNum: Int = DAY_NAMES_FULL.firstIndex(of: firstMonthDayName)!
        let dayOfWeek: String = DAY_NAMES_FULL[dayOfWeekNum]
        let day = Day(dayOfWeek: dayOfWeek, dayNumber: dayNum, events: [Event()])
        days.append(day)
    }
    
    return days
}
