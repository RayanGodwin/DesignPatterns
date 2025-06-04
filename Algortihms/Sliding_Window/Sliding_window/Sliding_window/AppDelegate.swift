//
//  AppDelegate.swift
//  Sliding_window
//
//  Created by Rayan Godwin Sequeira on 01/06/25.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Insert code here to initialize your application
        let input = [9, 7, 6, 5, 4, 3, 2]
        let k = 3
        var result: [Int] = []
        //Output = [4, 6, 7]
        var deque: [Int] = []
        for i in 0..<input.count {
            if !deque.isEmpty, deque.first! <= i - k  {
                deque.removeFirst()
            }
            
            while !deque.isEmpty, input[deque.last!] > input[i] {
                deque.removeLast()
            }
            
            deque.append(i)
            
            if i >= k-1 {
                result.append(input[deque.first!])
            }
        }
        print("\(result)")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

