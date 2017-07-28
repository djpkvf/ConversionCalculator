//
//  Conversion.swift
//  Conversion Calculator
//
//  Created by Dominic Pilla on 7/26/17.
//  Copyright © 2017 Dominic Pilla. All rights reserved.
//

import Foundation

class Conversion {
    
    var to, from: Symbols
    
    init(convertFrom from: Symbols, convertTo to: Symbols) {
        self.to = to
        self.from = from
    }
    
    enum Symbols: String {
        case miles = "mi"
        case kilometers = "km"
        case fahrenheit = "°F"
        case celcius = "°C"
    }
    
    func convertValues(convertFrom: String, convertTo: Symbols) -> String {
        
        let start = convertFrom.startIndex
        let end = convertFrom.index(convertFrom.endIndex, offsetBy: -2)
        let range = start..<end
        
        let convertValue: Double = Double(convertFrom.substring(with: range))!
        
        // Switch case for distinguishing what function to convert to
        switch convertTo {
            case .miles:
                return String(format: "%0.3f", convertValue / 1.60934) + convertTo.rawValue
            case .kilometers:
                return String(format: "%0.3f", convertValue * 1.60934) + convertTo.rawValue
            case .fahrenheit:
                return String(format: "%0.3f", (convertValue * (9/5)) + 32) + convertTo.rawValue
            case .celcius:
                return String(format: "%0.3f", (convertValue - 32) * (5/9)) + convertTo.rawValue
        }
    }
}
