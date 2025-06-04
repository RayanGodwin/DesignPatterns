//
//  main.swift
//  LongestStringPalindrome
//
//  Created by Rayan Godwin Sequeira on 04/06/25.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    let array = Array(s)
    var start = 0
    var end = 0
    for i in 0..<array.count {
        let len1 = expandFromCenter(array, i, i)
        let len2 = expandFromCenter(array, i, i+1)
        let len = max(len1, len2)
        if len > end - start {
            start = i - (len - 1) / 2
            end = i + len / 2
        }
    }
    return String(array[start...end])
}

func expandFromCenter(_ s: [Character], _ low: Int, _ high: Int) -> Int {
    var left = low
    var right = high
    
    while left >= 0, right < s.count, s[left] == s[right] {
        left -= 1
        right += 1
    }
    
    return right - left - 1
}

print(longestPalindrome("babad")) // Output: "bab" or "aba"
print(longestPalindrome("cbbd"))  // Output: "bb"
