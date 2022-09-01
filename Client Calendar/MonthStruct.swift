//
//  MonthStruct.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/27/22.
//

import Foundation


struct MonthStruct {
    var monthType: MonthType
    var dayInt: Int
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType {
    case Previous
    case Current
    case Next
}
