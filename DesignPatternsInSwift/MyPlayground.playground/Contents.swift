//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum Title : String {
    case CEO = "Chief Executive Officer"
    case CTO = "Chief Technical Officer"
    case CFO = "Chief Financial Officer"
}

let myCEOString : String = Title.CEO
let myCEOValue : Title.CEO = "Chief Executive Officer"
