//: Playground - noun: a place where people can play

import UIKit

class RationalNumber {
    
    var numerator: Int
    
    var denominator: Int
    
    init(n: Int, m: Int) {
        numerator = n
        denominator = m
    }
    
    func add(number: RationalNumber) -> RationalNumber {
        
        return RationalNumber(n: numerator * number.denominator + number.numerator * denominator, m: denominator * number.denominator)
        
    }
    
    func sub(number: RationalNumber) -> RationalNumber {
        
        return RationalNumber(n: numerator * number.denominator - number.numerator * denominator, m: denominator * number.denominator)
        
    }
    
    func mult(number: RationalNumber) -> RationalNumber {
        
        return RationalNumber(n: numerator * number.numerator, m: denominator * number.denominator)
        
    }
    
    func div(number: RationalNumber) -> RationalNumber {
        
        return RationalNumber(n: numerator * number.denominator, m: denominator * number.numerator)
        
    }
    
    func equal(number: RationalNumber) -> Bool {
        
        return numerator * number.denominator == number.numerator * denominator
        
    }
    
    func greater(than number: RationalNumber) -> Bool {
        
        return numerator * number.denominator > number.numerator * denominator
        
    }
    
    func normalize() -> RationalNumber {
        
        let c = gcd(a: numerator, b: denominator)
        numerator /= c
        denominator /= c
        
        return self
    }
    
    func gcd(a: Int, b: Int) -> Int {
        
        var one = a
        var two = b
        
        while one != two {
            
            if one > two {
                one -= two
            } else {
                two -= one
            }
            
        }
        
        return one
    }
    
}

let a = RationalNumber(n: 1, m: 2)
let b = RationalNumber(n: 2, m: 2)

a.add(number: b)
a.add(number: b).mult(number: b).normalize()
