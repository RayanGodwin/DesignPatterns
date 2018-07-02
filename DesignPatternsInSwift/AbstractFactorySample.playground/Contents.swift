//: Playground - noun: a place where people can play
// Used when you want to create family of products wherein each product within a family is varying slightly, however the main drawback is to add a new product we will have to change the interface of the Factory to add new method which will lead to change in all the facotries. Thus the impact of Abstract factory is greater than Factory or Factory method pattern.

import UIKit

protocol Light {
    var turnedOn: Bool{get set}
    func turnOn()
    func turnOff()
}

protocol LightFactory {
    func createBulb(turnOn: Bool) -> Light
    func createTubeLight(turnOn: Bool) -> Light
    func createHeadlight(turnOn: Bool) -> Light
}

class LEDFactory : LightFactory {
    func createBulb(turnOn: Bool) -> Light {
        return LEDBulb(turnOn: turnOn)
    }
    func createTubeLight(turnOn: Bool) -> Light {
        return LEDTubeLight(turnOn: turnOn)
    }
    func createHeadlight(turnOn: Bool) -> Light {
        return LEDHeadLight(turnOn: turnOn)
    }
}

class CFLFactory : LightFactory {
    func createBulb(turnOn: Bool) -> Light {
        return CFLBulb(turnOn: turnOn)
    }
    func createTubeLight(turnOn: Bool) -> Light {
        return CFLTubeLight(turnOn: turnOn)
    }
    func createHeadlight(turnOn: Bool) -> Light {
        return CFLHeadLight(turnOn: turnOn)
    }
}

class SimpleBulbFactory : LightFactory {
    func createBulb(turnOn: Bool) -> Light {
        return SimpleBulb(turnOn: turnOn)
    }
    func createTubeLight(turnOn: Bool) -> Light {
        return SimpleTubeLight(turnOn: turnOn)
    }
    func createHeadlight(turnOn: Bool) -> Light {
        return SimpleHeadLight(turnOn: turnOn)
    }
}

class LEDBulb: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("LEDBulb is already On")
            return
        }
        self.turnedOn = true
        print("LEDBulb is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("LEDBulb is already Off")
            return
        }
        self.turnedOn = false
        print("LEDBulb is turned Off")
    }
}

class LEDTubeLight: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("LEDTubeLight is already On")
            return
        }
        self.turnedOn = true
        print("LEDTubeLight is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("LEDTubeLight is already Off")
            return
        }
        self.turnedOn = false
        print("LEDTubeLight is turned Off")
    }
}

class LEDHeadLight: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("LEDHeadLight is already On")
            return
        }
        self.turnedOn = true
        print("LEDHeadLight is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("LEDHeadLight is already Off")
            return
        }
        self.turnedOn = false
        print("LEDHeadLight is turned Off")
    }
}


class CFLBulb: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("CFLBulb is already On")
            return
        }
        self.turnedOn = true
        print("CFLBulb is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("CFLBulb is already Off")
            return
        }
        self.turnedOn = false
        print("CFLBulb is turned Off")
    }
}

class CFLTubeLight: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("CFLTubeLight is already On")
            return
        }
        self.turnedOn = true
        print("CFLTubeLight is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("CFLTubeLight is already Off")
            return
        }
        self.turnedOn = false
        print("CFLTubeLight is turned Off")
    }
}

class CFLHeadLight: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("CFLHeadLight is already On")
            return
        }
        self.turnedOn = true
        print("CFLHeadLight is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("CFLHeadLight is already Off")
            return
        }
        self.turnedOn = false
        print("CFLHeadLight is turned Off")
    }
}


class SimpleBulb: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("SimpleBulb is already On")
            return
        }
        self.turnedOn = true
        print("SimpleBulb is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("SimpleBulb is already Off")
            return
        }
        self.turnedOn = false
        print("SimpleBulb is turned Off")
    }
}

class SimpleTubeLight: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("SimpleTubeLight is already On")
            return
        }
        self.turnedOn = true
        print("SimpleTubeLight is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("SimpleTubeLight is already Off")
            return
        }
        self.turnedOn = false
        print("SimpleTubeLight is turned Off")
    }
}

class SimpleHeadLight: Light {
    var turnedOn: Bool
    init(turnOn: Bool) {
        self.turnedOn = turnOn
    }
    
    func turnOn() {
        guard self.turnedOn == false else {
            print("SimpleHeadLight is already On")
            return
        }
        self.turnedOn = true
        print("SimpleHeadLight is turned On")
    }
    
    func turnOff() {
        guard self.turnedOn == true else {
            print("SimpleHeadLight is already Off")
            return
        }
        self.turnedOn = false
        print("SimpleHeadLight is turned Off")
    }
}

var bulbToUse = SimpleBulbFactory().createBulb(turnOn: true)
var tubeLightToUse = SimpleBulbFactory().createTubeLight(turnOn: true)
var headLightToUse = SimpleBulbFactory().createHeadlight(turnOn: true)

bulbToUse.turnOn()
bulbToUse.turnOff()
tubeLightToUse.turnOn()
tubeLightToUse.turnOff()
headLightToUse.turnOn()
headLightToUse.turnOff()

bulbToUse = CFLFactory().createBulb(turnOn: true)
tubeLightToUse = CFLFactory().createTubeLight(turnOn: true)
headLightToUse = CFLFactory().createHeadlight(turnOn: true)

bulbToUse.turnOn()
bulbToUse.turnOff()
tubeLightToUse.turnOn()
tubeLightToUse.turnOff()
headLightToUse.turnOn()
headLightToUse.turnOff()

bulbToUse = LEDFactory().createBulb(turnOn: false)
tubeLightToUse = LEDFactory().createTubeLight(turnOn: false)
headLightToUse = LEDFactory().createHeadlight(turnOn: false)

bulbToUse.turnOn()
bulbToUse.turnOff()
tubeLightToUse.turnOn()
tubeLightToUse.turnOff()
headLightToUse.turnOn()
headLightToUse.turnOff()

