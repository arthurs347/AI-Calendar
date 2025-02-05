//
//  ContentView.swift
//  AICalendar
//
//  Created by Arthur Sanchez on 12/21/24.
//

import Swift
import SwiftUI

var years: [Year] = []
let calendar = Calendar.current

var currCalendarComponents: DateComponents {
    var components = calendar.dateComponents([.year, .month, .day], from: Date())
    components.month = TESTING_MONTH_NUM
    components.year = TESTING_YEAR_NUM
    return components
}

struct ContentView: View {
    
    let columns = Array(repeating: GridItem(), count: 7)
    @State var title = ""
    @State var description = ""
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var allDay = false

    var body: some View {
        let numOfDays = getMonthNumOfDays(monthNum: TESTING_MONTH_NUM, year: TESTING_YEAR_NUM)
        let firstDayOfMonthName = getFirstDayOfMonthName(currCalendarComponents)
        let daysOffset = getNumOfDaysToOffset(firstDayOfMonthName, DAY_NAMES_FULL)
        let years = firstTimeInitializeCalendar(monthNum: TESTING_MONTH_NUM, year: TESTING_YEAR_NUM, firstMonthDayName: firstDayOfMonthName)

        Form {
            TextField("Title", text: $title).padding(.top)
            HStack{
                Spacer()
                DatePicker("Start Date", selection: $startDate)
                DatePicker("End Date", selection: $endDate)
                Spacer()
            }
            TextField("Description", text: $description)
            Toggle(isOn: $allDay) {
                Text("All Day Event")
            }
            Button("Create Event") {
                let endDateCompared = endDate == startDate ? endDate : nil
                createEvent(title: title, description: description, start: startDate, end: endDateCompared)
            }
        }
        
        LazyVGrid(columns: columns, content: {
            ForEach(DAY_NAMES_ABB, id: \.self) { day in
                Text(day)
                    .fontWeight(.bold)
                    .padding()
                    
            }
            ForEach(daysOffset..<numOfDays, id: \.self) {
                dayNumIndex in
                if (dayNumIndex < 0) {
                    GroupBox() {}
                }
                else {
                    var currDay: Day {
                        years[TESTING_YEAR_INDEXED].months[TESTING_MONTH_NUM_INDEXED].days[dayNumIndex]
                    }
                    var dayNumToDisplay: Int {
                        return currDay.dayNum}
                    var numOfEvents: Int {
                        return currDay.events.count
                    }
                    GroupBox() {
                        Text(String(dayNumToDisplay))
                        ForEach(0..<numOfEvents, id: \.self) { eventNum in
                            Text(currDay.events[eventNum].title)
                        }
                    }
                }
            }
        }).frame(maxWidth: .infinity)
    }
}


#Preview {
    ContentView()
}
