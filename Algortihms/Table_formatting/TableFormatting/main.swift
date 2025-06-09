//
//  main.swift
//  checkpoint_test1
//
//  Created by Rayan Godwin Sequeira on 08/06/25.
//

import Foundation

public func solution(_ input : [Int], _ k : Int) {
    var i = 0
    var isFirstRow = true
    let cellWidth = input.map{ String($0).count }.max() ?? 0
    while i < input.count {
        let row = Array(input[i..<min(i+k, input.count)])
                
        var line = ""
        for _ in row {
            line += "+" + String(repeating: "-", count: cellWidth)
        }
        line += "+"
        
        var content = ""
        for num in row {
            let numStr = String(num)
            let space = String(repeating: " ", count: cellWidth - numStr.count)
            content += "|" + space + numStr
        }
        content += "|"
        if isFirstRow {
            print(line)
            isFirstRow = false
        }
        print(content)
        print(line)
        i += k
    }
}

let arr = [12, 5, 123, 9 ,45 ,6 , 789]
let k = 3
solution(arr, k)
