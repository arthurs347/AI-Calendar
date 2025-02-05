//
//  Time.swift
//  AICalendar
//
//  Created by Arthur Sanchez on 12/26/24.
//
import SwiftUI

struct Day: Identifiable {
    let id: Int = UUID().hashValue
    let dayNum: Int
    let dayOfWeek: String
    let dateComponents: DateComponents
    var events: [Event]
}
struct Month: Identifiable {
    let id: Int = UUID().hashValue
    var days: [Day]
    let monthNum: Int
    let year: Int

}
struct Year: Identifiable {
    let id: Int = UUID().hashValue
    var months: [Month]
    let year: Int
}
