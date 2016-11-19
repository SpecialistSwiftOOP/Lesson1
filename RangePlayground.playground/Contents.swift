//: Playground - noun: a place where people can play

import UIKit

class ClosedRange {
    
    var left: Double
    
    var right: Double
    
    init(left: Double, right: Double) {
        self.left = left
        self.right = right
    }
    
    func intersect(range: ClosedRange) -> ClosedRange? {
        
        var intersection: ClosedRange? = nil
        
        if isInside(range: range) {
            intersection = range
        } else if range.isInside(range: self) {
            intersection = self
        } else if !isOutside(range: range) {
            intersection = ClosedRange(left: max(range.left, left), right: min(right, range.right))
        }
        
        return intersection
        
    }
    
    func subtract(range: ClosedRange) -> [ClosedRange]? {
        
        var ranges: [ClosedRange]? = nil
        
            
            if isInside(range: range) {
                ranges = [
                    ClosedRange(left: left, right: range.left),
                    ClosedRange(left: range.right, right: right)
                ]
            } else {
                
                if range.right >= right {
                    ranges = [
                        ClosedRange(left: left, right: range.left)
                    ]
                } else if range.left <= left {
                    ranges = [
                        ClosedRange(left: range.right, right: right)
                    ]
                }
                
        }
        
        return ranges
    }
    
    func isInside(range: ClosedRange) -> Bool {
        
        return range.left >= left && range.right <= right
        
    }
    
    func isOutside(range: ClosedRange) -> Bool {
        
        return (range.right < left) || (range.left > right)
        
    }
    
}

let main = ClosedRange(left: 10, right: 20)

let right = ClosedRange(left: 15, right: 25)
let inside = ClosedRange(left: 13, right: 18)
let left = ClosedRange(left: 5, right: 15)

main.intersect(range: right)!
main.intersect(range: inside)!
main.intersect(range: left)!

right.intersect(range: main)!
inside.intersect(range: main)!
left.intersect(range: main)!

main.subtract(range: inside)
main.subtract(range: left)
main.subtract(range: right)