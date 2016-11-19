//: Playground - noun: a place where people can play

import UIKit

class Processor {
    
    init() {
        
        var number = 0
        
        for _ in 0...100000 {
            number += 1
        }
        
    }
    
    func registerState(for register: Int) -> Int {
        
        return register + 10
        
    }
    
}

class LazyComputer {
    
    var processor = Processor()
    
    func compute() -> Double {
        
        var result: Double = 0.0
        
        for i in 1...10 {
            result += Double(processor.registerState(for: i))
        }
        
        return result
        
    }
    
}

let lazyComputer = LazyComputer()
print("I'm ready!")
print("Computation result = \(lazyComputer.compute())")