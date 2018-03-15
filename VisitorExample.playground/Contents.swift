//: Playground - noun: a place where people can play

import UIKit

// Used when we want to avoid adding complex algortihms to our model classes but still have the it placed in the visitor. One can add/modify algorithms without modifying the model classes by adding/modifying new visitors however for simple model classes and simple algorithms it may be an overkill since it may not be easily understandable at the very first attempt.

protocol Deposits {
    var principalAmount: Double {get set}
    func accept(visitor: Visitor)
}

protocol Visitor {
    func visit(object: TaxSaver)
    func visit(object: InsuranceSaver)
    func visit(object: SharesSaver)
}

class TaxSaver: Deposits {
    var principalAmount: Double = 10000
    func accept(visitor: Visitor) {
        visitor.visit(object: self)
    }
}

class InsuranceSaver: Deposits {
    var principalAmount: Double = 1000
    func accept(visitor: Visitor) {
        visitor.visit(object: self)
    }
}

class SharesSaver: Deposits {
    var principalAmount: Double = 5000
    func accept(visitor: Visitor) {
        visitor.visit(object: self)
    }
}

class InterestCalculator: Visitor {
    var interestAcrrued: Double = 0
    
    func visit(object: TaxSaver) {
        interestAcrrued = interestAcrrued + object.principalAmount * 0.20
    }
    
    func visit(object: InsuranceSaver) {
        interestAcrrued = interestAcrrued + object.principalAmount * 0.05
    }
    
    func visit(object: SharesSaver) {
        interestAcrrued = interestAcrrued + object.principalAmount * 0.35
    }
}

class TaxAuditor: Visitor {
    var taxToBePaid: Double = 0
    
    func visit(object: TaxSaver) {
        taxToBePaid = taxToBePaid + object.principalAmount * 0.10
    }
    
    func visit(object: InsuranceSaver) {
        taxToBePaid = taxToBePaid + object.principalAmount * 0.05
    }
    
    func visit(object: SharesSaver) {
        taxToBePaid = taxToBePaid + object.principalAmount * 0.15
    }
}

class Person: Deposits {
    var savings: [Deposits]!
    var interestObtained: Double = 0.0
    var taxToBePaid: Double = 0.0
    var principalAmount: Double = 0.0
    
    init(savings: [Deposits]) {
        self.savings = savings
    }
    
    func accept(visitor: Visitor) {
        self.savings.map { $0.accept(visitor: visitor) }
    }
}

let taxSaver = TaxSaver()
let insuranceSaver = InsuranceSaver()
let sharesSaver = SharesSaver()

let taxAuditor = TaxAuditor()
let interestCalculator = InterestCalculator()

let person = Person(savings: [taxSaver, insuranceSaver, sharesSaver])
person.accept(visitor: taxAuditor)
person.accept(visitor: interestCalculator)
print ("Tax calulated for person \(taxAuditor.taxToBePaid)")
print ("Interest calulated for person \(interestCalculator.interestAcrrued)")



