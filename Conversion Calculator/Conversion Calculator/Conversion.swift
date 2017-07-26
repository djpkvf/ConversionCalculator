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
}
