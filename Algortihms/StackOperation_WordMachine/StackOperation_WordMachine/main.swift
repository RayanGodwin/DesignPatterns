
//
//  File2.swift
//  Stack Operation with word machine
//
//  Created by Rayan Godwin Sequeira on 08/06/25.
//

import Foundation

public func solution1(_ S : inout String) -> Int {
    var stack: [Int] = []
    let maxValue = (1 << 20) - 1
    for input in S.split(separator: " ") {
        switch input {
        case "DUP":
            guard let top = stack.last else { return -1 }
            stack.append(top)
            
        case "POP":
            guard !stack.isEmpty else { return -1 }
            stack.removeLast()
            
        case "+":
            guard stack.count >= 2 else { return -1 }
            let a = stack.removeLast()
            let b = stack.removeLast()
            let sum = a + b
            if sum < 0 {
                return -1
            }
            stack.append(sum)
            
        case "-":
            guard stack.count >= 2 else { return -1 }
            let a = stack.removeLast()
            let b = stack.removeLast()
            let diff = a - b
            if diff < 0 {
                return -1
            }
            stack.append(diff)
            
        default:
            if let num = Int(String(input)) {
                if num > 0 , num < maxValue {
                    stack.append(num)
                } else {
                    return -1
                }
            } else {
                return -1
            }
        }
    }
    return stack.last ?? -1
}

var string = "4 5 6 - 7 +"
print("\(solution(&string))")

string = "13 DUP 4 POP 5 DUP + DUP + -"
print("\(solution(&string))")

string = "5 6 + -"
print("\(solution(&string))")

string = "3 DUP 5 - -"
print("\(solution(&string))")

string = "1048575 DUP +"
print("\(solution(&string))")

