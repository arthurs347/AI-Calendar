//
//  CalendarTests.swift
//  AICalendarTests
//
//  Created by Arthur Sanchez on 1/15/25.
//

import XCTest
import Foundation
@testable import AICalendar

final class CalendarTests: XCTestCase {
    
    let DAY_NAMES_FULLTest = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    func testGetFirstDayOfMonthName() throws {
        
        var testMonthNum = 1
        var testYear = 2025
        var testComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        testComponents.month = testMonthNum
        testComponents.year = testYear
        var firstDayofMonthName = getFirstDayOfMonthName(testComponents)
        XCTAssertEqual(firstDayofMonthName, "Wednesday", "January 1, 2025 should be Wednesday")
        
        testMonthNum = 6
        testYear = 2024
        testComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        testComponents.month = testMonthNum
        testComponents.year = testYear
        firstDayofMonthName = getFirstDayOfMonthName(testComponents)
        XCTAssertEqual(firstDayofMonthName, "Saturday", "June 1, 2024 should be Saturday")
    }
    
    func testGetDayName() throws {
        func getDayName(dayNum: Int, monthNum: Int, year: Int) -> String {
            let dateComponents = DateComponents(year: year, month: monthNum, day: dayNum)
            let day = calendar.date(from: dateComponents)
            let dayName = day!.formatted(.dateTime.weekday(.wide))
            return dayName
        }
        var dayNumTest = 1
        var monthNumTest = 1
        var yearTest = 2025
        var dayName = getDayName(dayNum: dayNumTest, monthNum: monthNumTest, year: yearTest)
        XCTAssertEqual(dayName, "Wednesday")
        
        dayNumTest = 25
        monthNumTest = 5
        yearTest = 2024
        dayName = getDayName(dayNum: dayNumTest, monthNum: monthNumTest, year: yearTest)
        XCTAssertEqual(dayName, "Saturday")
        
    }
    
    func testGetNumOfDaysToOffset() throws {
        var firstDayOfMonthNameTest = "Friday"
        var numOfDaysToOffsetTest = getNumOfDaysToOffset(firstDayOfMonthNameTest, DAY_NAMES_FULLTest)
        XCTAssertEqual(numOfDaysToOffsetTest, -5)
        
        firstDayOfMonthNameTest = "Sunday"
        numOfDaysToOffsetTest = getNumOfDaysToOffset(firstDayOfMonthNameTest, DAY_NAMES_FULLTest)
        XCTAssertEqual(numOfDaysToOffsetTest, 0)
    }
    
    func testGetMonthNumOfDays() throws {
        let calendar = Calendar.current
        
        var testMonthNum = 1
        var testYear = 2025
        var testComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        testComponents.month = testMonthNum
        testComponents.year = testYear
        var monthNumOfDays = getMonthNumOfDays(monthNum: testMonthNum, year: testYear)
        XCTAssertEqual(monthNumOfDays, 31)
        
        testMonthNum = 4
        testYear = 2024
        testComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        testComponents.month = testMonthNum
        testComponents.year = testYear
        monthNumOfDays = getMonthNumOfDays(monthNum: testMonthNum, year: testYear)
        XCTAssertEqual(monthNumOfDays, 30)
    }
    
    func testInitializeCalendar() throws {
        
    }

}
