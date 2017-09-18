//
//  Model.swift
//  CalculatorSilver
//
//  Created by Julio Estrada on 8/28/17.
//  Copyright © 2017 jestrada. All rights reserved.
//

import Foundation

// I like this class. This could have been a struct but a class was the right call.
// A class is like a living organism in your program. I can imagine this being the
// brain and having features like: calculating longer equations where you'll probably
// need to store memory. I can see caching, history, etc being added. This is headed in
// the right direction. Whatever you do try your best to avoid making this a singleton.
class Calculator {

    func add(a:String, b:String) -> Double {
        let factor = unwrapParams(a, b)
        let total = factor.0 + factor.1
        return total
    }

    func subtract(a:String, b: String) -> Double {
        let factor = unwrapParams(a, b)
        let total = factor.0 - factor.1
        return total
    }

    func multiply(a:String, b: String) -> Double {
        let factor = unwrapParams(a, b)
        let total = factor.0 * factor.1
        return total
    }

    func divide(a:String, b: String) -> Double {
        let factor = unwrapParams(a, b)
        let total = factor.0 / factor.1
        return total
    }

    func unwrapParams(_ a:String, _ b:String) -> (Double, Double) {
        guard let first = Double(a), let second = Double(b) else {
            return (0.00, 0.00)
        }
        return (first, second)
    }
}
