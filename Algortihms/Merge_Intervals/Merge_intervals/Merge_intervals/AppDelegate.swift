//
//  AppDelegate.swift
//  Merge_intervals
//
//  Created by Rayan Godwin Sequeira on 01/06/25.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to tear down your application
        let mergedIntervals = mergeCustomIntervals([[1, 3], [2, 6], [8, 10], [10, 12], [15, 18]])
        print("\(mergedIntervals)")
        
        let arrival = [900, 940, 950, 1100, 1500, 1800]
        let departure = [910, 1200, 1120, 1130, 1900, 2000]
        let platforms = minPlatforms(arr: arrival, dep: departure)
        print(platforms) // Output: 3
        
        let nums = [1,3,-1,-3,5,3,6,7]
        let k = 3
        print(maxSlidingWindow(input: nums, k: k))
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    func maxSlidingWindow(input: [Int], k: Int) -> [Int] {
        var deque: [Int] = []
        var result: [Int] = []
        for i in 0..<input.count {
            if !deque.isEmpty, deque.first! < i - k {
                deque.removeFirst()
            }
            while !deque.isEmpty, input[deque.last!] < input[i] {
                deque.removeLast()
            }
            deque.append(i)
            if i >= k - 1 {
                result.append(input[deque.first!])
            }
        }
        return result
    }
    
    func mergeCustomIntervals(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty {
            return []
        }
        let sortedInput = intervals.sorted { $0[0] < $1[0] }
        var result: [[Int]] = [sortedInput[0]]
        for i in 0..<sortedInput.count {
            let currentInterval = sortedInput[i]
            var lastInterval = result[result.count - 1]
            if lastInterval[1] > currentInterval[0] {
                lastInterval[1] = max(lastInterval[1], currentInterval[1])
                result[result.count - 1] = lastInterval
            } else {
                result.append(currentInterval)
            }
        }
        return result
    }
    
    func minPlatforms(arr: [Int], dep: [Int]) -> Int {
        if arr.isEmpty || dep.isEmpty {
            return 0
        }
        let n = arr.count
        var i = 0, j = 0
        var platformNeeded = 0
        var minPlatformNeeded = 1
        while i < n && j < n {
            if arr[i] < dep[j] {
                i += 1
                platformNeeded += 1
                minPlatformNeeded = max(minPlatformNeeded, platformNeeded)
            } else {
                j += 1
                platformNeeded -= 1
            }
        }
        return minPlatformNeeded
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

