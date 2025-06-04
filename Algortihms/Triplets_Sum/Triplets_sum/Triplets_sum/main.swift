//
//  main.swift
//  Triplets_sum
//
//  Created by Rayan Godwin Sequeira on 03/06/25.
//

import Foundation


func tripletsSum(_ arr: [Int], _ target: Int = 0) -> [[Int]] {
    let n = arr.count
    var result: [[Int]] = []
    guard n >= 3 else {
        return result
    }
    let sortedArray = arr.sorted()
    for i in 0..<n-2 {
        if i > 0 && sortedArray[i] == sortedArray[i-1] {
            continue
        }
        var left = i+1
        var right = n-1
        
        while left < right {
            let sum = sortedArray[i] + sortedArray[left] + sortedArray[right]
            if sum == target {
                result.append([sortedArray[i], sortedArray[left], sortedArray[right]])
                left = left + 1
                right = right - 1
                while left < right, sortedArray[left] == sortedArray[left-1] {
                    left = left + 1
                }
                while left < right, sortedArray[right] == sortedArray[right+1] {
                    right = right - 1
                }
            } else if sum < target {
                left = left + 1
            } else {
                right = right - 1
            }
        }
    }
    return result
}

func pairSum(_ arr: [Int], _ target: Int = 0) -> [[Int]] {
    let n = arr.count
    var result: [[Int]] = []
    guard n >= 2 else {
        return result
    }
    let sortedArray = arr.sorted()
    var left = 0
    var right = n - 1
    while left < right {
        let sum = sortedArray[left] + sortedArray[right]
        if sum == target {
            result.append([sortedArray[left], sortedArray[right]])
            left += 1
            right -= 1
            
            while left < right && sortedArray[left] == sortedArray[left - 1] {
                left += 1
            }
            while left < right && sortedArray[right] == sortedArray[right + 1] {
                right -= 1
            }
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return result
}
   
func main() {
    var result = tripletsSum([-1, 0, 1, 2, -1, -4])
    print(result)
    
    result = pairSum([-1, 0, 1, 2, -1, -4])
    print(result)
}

main()
