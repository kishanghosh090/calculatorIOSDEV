//
//  calculatorModel.swift
//  calculator
//
//  Created by kishan rana ghosh on 15/11/25.
//

import Foundation
import SwiftUI

enum Keys: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero  = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "X"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return Color("Vopretor")
        case .clear, .negative, .percent:
            return Color("Hopretor")
        default:
            return Color("num")
        }
    }
}


enum Opretion {
    case add, subtract,multiply,divide
}
