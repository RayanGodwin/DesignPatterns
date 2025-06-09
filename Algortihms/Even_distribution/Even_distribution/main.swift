//
//  Untitled.swift
//
//  Created by Rayan Godwin Sequeira on 08/06/25.
//

import Foundation

public func solution2(_ input : inout [Int]) -> Int {
    let target = 10
    let total = input.reduce(0, +)
    let requiredTotal = target * input.count
    
    if total != requiredTotal {
        return -1
    }
    
    var totalMoves = 0
    var balance = 0
    
    for i in  0..<input.count {
        let diff = input[i] - target
        balance += diff
        totalMoves += abs(balance)
    }
    return totalMoves
}

var input = [7,14,10]
print("\(solution2(&input))")
















