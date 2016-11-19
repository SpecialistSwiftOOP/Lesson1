//: Playground - noun: a place where people can play

import UIKit

enum Color: String {
    
    case red = "red"
    
    case ginger = "ginger"
    
    case black = "black"
    
}

struct Position {
    
    var X: Float
    
    var Y: Float
    
}

struct Room {
    
    let width: Float
    
    let height: Float
    
}

class Cat {
    
    var name: String
    var type: String
    var color: Color
    var position = Position(X: 0, Y: 0)
    var room = Room(width: 10, height: 10)
    
    init(catName: String, catType: String, catColor: Color) {
        name = catName
        type = catType
        color = catColor
    }
    
    func meow() {
        print("Cat speaks 'meow'")
    }
    
    func run(dx: Float, dy: Float) -> Bool {
        
        let newPosition = Position(X: position.X + dx, Y: position.Y + dy)
        let result = newPosition.X < room.width && newPosition.Y < room.height && newPosition.X >= 0 && newPosition.Y >= 0
        
        if result {
            position = newPosition
        }
        
        return result
    }
    
}

var cat = Cat(catName: "Васька", catType: "чеширский", catColor: .ginger)
print(cat.color.rawValue, cat.name, cat.type)

if cat.run(dx: 5, dy: 0) {
    cat.meow()
}

if !cat.run(dx: 0, dy: 11) {
    cat.meow()
    cat.meow()
}
