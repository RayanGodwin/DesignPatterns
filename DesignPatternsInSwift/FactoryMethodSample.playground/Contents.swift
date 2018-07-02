//: Playground - noun: a place where people can play

// Creation logic is placed in the sub classes of parent abstract Factory,
// Works on the template pattern to forward the call from parent to child class.
// It is used in instances where we need to do more than just object creation, like factory method also wants to control the object created.

import UIKit

protocol Subject {
    var name: String { get set }
    init(name: String)
    func read()
}

class Mathematics: Subject {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
    func read() {
        print("Maths is tough")
    }
}

class Physics: Subject {
    var name: String

    required init(name: String) {
        self.name = name
    }
    
    func read() {
        print("Physics is tougher")
    }
    
}

protocol BaseFactory : class {
    var subjectToDeliver: Subject! { get set }
    var shippingCharge: Double! { get set }
    
    // Factory method that contains the creation as well as managing the product.
    func orderSubject(name: String)
    func createSubject(name: String)
    func calculateShippingCharge()
    func deliver()
}

extension BaseFactory {
    public func orderSubject(name: String) {
        self.createSubject(name: name)
        self.calculateShippingCharge()
        self.deliver()
    }
    
    public func deliver() {
        print ("Shipping charges would be \(shippingCharge)")
    }
}

class AmazonPhysicsFactory: BaseFactory {
    var subjectToDeliver: Subject!
    var shippingCharge: Double!
    
    public func createSubject(name: String) {
        subjectToDeliver = Physics(name: name)
    }
    
    public func calculateShippingCharge() {
        shippingCharge = 10.00
    }
}

class AmazonMathematicsFactory: BaseFactory {
    var subjectToDeliver: Subject!
    var shippingCharge: Double!
    
    public func createSubject(name: String) {
        subjectToDeliver = Mathematics(name: name)
    }
    
    public func calculateShippingCharge() {
        shippingCharge = 20.00
    }
}

let physicsFactory = AmazonPhysicsFactory()
let mathematicsFactory = AmazonMathematicsFactory()

physicsFactory.orderSubject(name: "Physics")
mathematicsFactory.orderSubject(name: "Mathematics")


