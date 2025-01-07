//
//  ContentView.swift
//  AI-Calendar
//
//  Created by Arthur Sanchez on 12/21/24.
//

import Swift
import SwiftUI


var days = [Day(dayOfWeek: "Monday", dayNumber: 1, events: [Event()])]
let DAY_NAMES_ABB = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
let DAY_NAMES_FULL = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
let numOfDays = 31

struct ContentView: View {
    
    let columns = Array(repeating: GridItem(), count: 7)
    @State var title = ""
    @State var description = ""
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var currDate = Date()


    var body: some View {
        
        let firstDayOfMonthName = getFirstDayOfMonthName(currDate, DAY_NAMES_FULL).0
        let daysOffset = getFirstDayOfMonthName(currDate, DAY_NAMES_FULL).1
        let days = initializeCalendar(month: 12, firstMonthDayName: firstDayOfMonthName)

        Form {
            TextField("Title", text: $title).padding(.top)
            HStack{
                Spacer()
                DatePicker("Start Date", selection: $startDate)
                DatePicker("End Date", selection: $endDate)
                Spacer()
            }
            TextField("Description", text: $description)
            Button("Create Event") {
                
            }
            
        }

        LazyVGrid(columns: columns, content: {
            ForEach(DAY_NAMES_ABB, id: \.self) { day in
                Text(day)
                    .fontWeight(.bold)
                    .padding()
                    
            }
            ForEach(daysOffset..<numOfDays+1, id: \.self) { dayNum in
                if (dayNum < 0) {
                    GroupBox() {}
                } else {
                    GroupBox() {
                        Text(String(days[dayNum].dayNumber))
                        Text(days[0].events[0].title)
                    }
                }
                
            }
            
            
            

        }).frame(maxWidth: .infinity)
        
    }
}


#Preview {
    ContentView()
}
