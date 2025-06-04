//
//  main.swift
//  LongestSubstringWithoutRepeatingCharacters
//
//  Created by Rayan Godwin Sequeira on 04/06/25.
//

import Foundation

func longestSubstringWithoutRepeatingCharacters(_ input: String) -> Int {
    var charHashMap: [Character: Int] = [:]
    var maxLength = 0
    var left = 0
    for (right, letter) in input.enumerated() {
        if let prevOccurence = charHashMap[letter], prevOccurence >= left {
            left = prevOccurence + 1
        }
        charHashMap[letter] = right
        maxLength = max(maxLength, right - left + 1)
    }
    return maxLength
}

let inputString = "abcdabcdeabb"
print(longestSubstringWithoutRepeatingCharacters(inputString))
