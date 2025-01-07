//
//  Time.swift
//  AI-Calendar
//
//  Created by Arthur Sanchez on 12/26/24.
//
import SwiftUI

struct Day: Identifiable {
    let id: Int = UUID().hashValue
    let dayOfWeek: String
//    let month: String
//    let year: String
    let dayNumber: Int
//    let date: Date
    let events: [Event]
}
struct Month: Identifiable {
    let id: Int = UUID().hashValue
    let month: Int
    let year: Int
    let days: [Day]

}
struct Year: Identifiable {
    let id: Int = UUID().hashValue
    let year: Int
    let months: [Month]
}
