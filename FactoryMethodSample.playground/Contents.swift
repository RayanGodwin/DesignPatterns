//: Playground - noun: a place where people can play
// Creation logic is placed in the sub classes of parent abstract Factory. 

import UIKit

protocol Subject {
    var name: String { get set }
    init(name: String)
    func read()
}

protocol SubjectFactory {
    func createSubject(name: String) -> Subject     // Factory Method
}

class Mathematics: Subject {
    var name: String
    
    required init (name: String) {
        self.name = name
    }
    
    func read() {
        print ("\(name) is not easy when compared to Chemistry but easier than Physics")
    }
}

class Physics: Subject {
    var name: String = "Physics"
    
    required init (name: String) {
        self.name = name
    }
    
    func read() {
        print ("\(name) is not easy when compared to maths but easier than Chemistry")
    }
}

class Chemistry: Subject {
    var name: String = "Chemistry"
    
    required init (name: String) {
        self.name = name
    }
    
    func read() {
        print("\(name) is easiest of all and also interesting specially when it comes to chemical equations")
    }
}

class MathematicsFactory: SubjectFactory {
    func createSubject(name: String) -> Subject {
        return Mathematics(name: name)
    }
}

class PhysicsFactory: SubjectFactory {
    func createSubject(name: String) -> Subject {
        return Physics(name: name)
    }
}

class ChemistryFactory: SubjectFactory {
    func createSubject(name: String) -> Subject {
        return Chemistry(name: name)
    }
}

MathematicsFactory().createSubject(name: "Mathematics").read()
PhysicsFactory().createSubject(name: "Physics").read()
ChemistryFactory().createSubject(name: "Chemistry").read()

