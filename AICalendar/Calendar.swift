//
//  Calendar.swift
//  AICalendar
//
//  Created by Arthur Sanchez on 12/24/24.
//
import SwiftUI

struct Event: Identifiable {
    let id: Int = UUID().hashValue
    var title: String = "New Event"
    var description: String = ""
    var allDay: Bool = false
    var start: DateComponents
    var end: DateComponents?
}

struct Task: Identifiable {
    let id: Int = UUID().hashValue
    var title: String = "New Task"
    var description: String = ""
    var allDay: Bool = false
    var start: DateComponents
    var end: DateComponents?
    var timeToComplete: Int? = 0
}

func createEvent(title: String? = "New Event", description: String? = "", start: Date, end: Date? = nil) {
    let currCalendar = Calendar.current
    let startComponents = currCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: start)
    let endComponents = end != nil ? currCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: end!) : nil

    // Safely unwrap title and description
    let eventTitle = title ?? "New Event"
    let eventDescription = description ?? ""
    
    var newEvent = Event(start: startComponents)
    newEvent.title = eventTitle
    newEvent.description = eventDescription
    newEvent.end = endComponents
    
    addEventToCalendar(event: newEvent)
}

func createTask(title: String? = "New Task", description: String? = "", start: Date, end: Date? = nil) {
    let currCalendar = Calendar.current
    let startComponents = currCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: start)
}
func addEventToCalendar(event: Event) {
    // add event to list
    // handle all-day event
    if event.end == nil {
        if event.start.hour == nil && event.start.minute == nil {
            
        }
    }
    // handle single day event
    if event.end == nil {
        
    }
    // handle multi day event
}

func firstTimeInitializeCalendar(monthNum:Int, year:Int, firstMonthDayName: String) -> [Year] {
    for year in EARLIEST_YEAR...LATEST_YEAR { // Set Years
        var newYear = Year(months: [], year: year)
        
        for monthNum in 1...12 { // Set Months
            var newMonth = Month(days: [], monthNum: monthNum, year: year)
            let numOfDays: Int = getMonthNumOfDays(monthNum: monthNum, year: year)

            for dayNum in 1...numOfDays { // Set Days
                let dayOfWeek = getDayName(dayNum: dayNum, monthNum: monthNum, year: year)
                let dateComponents = DateComponents(year: year, month: monthNum, day: dayNum)
                let newDay = Day(dayNum: dayNum, dayOfWeek: dayOfWeek, dateComponents: dateComponents, events: [])
                newMonth.days.append(newDay)
            }
            newYear.months.append(newMonth)
        }
        years.append(newYear)
    }
    return years
}


func DisplayCalendar(currMonth: Date) {
    
}

