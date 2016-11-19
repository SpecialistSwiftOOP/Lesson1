//: Playground - noun: a place where people can play

import UIKit

class Item {
    
    var next: Item!
    
    var value: Int
    
    init(value: Int) {
        self.value = value
        next = self
    }
    
}

class LinkedList {
    
    var start: Item?
    
    func append(item: Int) {
        
        if let start = start {
            
            var node = start
            while node.next !== start {
                node = node.next
            }
            
            let newItem = Item(value: item)
            newItem.next = start
            node.next = newItem
            
        } else {
            start = Item(value: item)
        }
        
    }
    
    func remove(at position: Int) -> Int? {
        
        var value: Int? = nil
        
        if let start = start {
            var prevNode = start
            var node = start
            
            for _ in 0..<position {
                prevNode = node
                node = node.next
            }
            
            value = node.value
            
            if start === node {
                
                if start.next === start {
                    self.start = nil
                } else {
                    var lastNode = start.next!
                    
                    while lastNode.next !== start {
                        lastNode = lastNode.next
                    }
                    
                    self.start = start.next
                    lastNode.next = self.start
                }
                
            } else {
                prevNode.next = node.next
            }
        }
        
        return value

    }
    
    subscript(index: Int) -> Int? {
        
        get {
            var result: Int? = nil
            
            if let start = start {
                
                var node = start
                
                for _ in 0..<index {
                    node = node.next
                }
                
                result = node.value
            }
            
            return result
        }
        
        set(item) {
            
            if let start = start {
                
                var node = start
                for _ in 0..<index {
                    node = node.next
                }
                
                node.value = item!
            }
        }
        
    }
    
}

func outputList(list: LinkedList) {
    
    if let start = list.start {
        
        print(start.value, terminator: " ")
        
        var node = start.next!
        
        while node !== start {
            print(node.value, terminator: " ")
            node = node.next
        }
        
        print()
    }
    
}

let list = LinkedList()
list.append(item: 20)
list.append(item: 30)
list.append(item: 40)

list.start!.value
list.start!.next.value
list.start!.next.next.value
list.start!.next.next.next.value

outputList(list: list)
list.remove(at: 1)
outputList(list: list)
list.remove(at: 0)
outputList(list: list)
list[0]
list.remove(at: 0)
list[0]

list.append(item: 10)
outputList(list: list)
list[0] = 30
outputList(list: list)
