//: Playground - noun: a place where people can play

import UIKit

struct Point {
    
    var x: Double
    
    var y: Double
    
}

class Triangle {
    
    var first: Point
    var second: Point
    var third: Point
    
    init(one: Point, two: Point, three: Point) {
        first = one
        second = two
        third = three
    }
    
    func distance(one: Point, two: Point) -> Double {
        
        return sqrt(pow(one.x - two.x, 2) + pow(one.y - two.y, 2))
        
    }
    
    func perimeter() -> Double {
        
        let ab = distance(one: first, two: second)
        let bc = distance(one: second, two: third)
        let ca = distance(one: third, two: first)
        
        return ab + bc + ca
        
    }
    
    func square() -> Double {
        
        let ab = distance(one: first, two: second)
        let bc = distance(one: second, two: third)
        let ca = distance(one: third, two: first)
        let p = ab + bc + ca
        
        return sqrt(p * (p - ab) * (p - bc) * (p - ca))
    }
    
    func angles() -> [Double] {
        
        var angles = [Double]()
        let ab = distance(one: first, two: second)
        let bc = distance(one: second, two: third)
        let ca = distance(one: third, two: first)
        
        let cosAngle = -(ab * ab - bc * bc - ca * ca) / 2.0 / bc / ca
        angles.append(acos(cosAngle) * 180.0 / M_PI)
        
        return angles
    }
    
}
