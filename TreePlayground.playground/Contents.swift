//: Playground - noun: a place where people can play

import UIKit

class Node {
    
    var left: Node?
    
    var right: Node?
    
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
}

class Tree {
    
    var root: Node?
    
    func append(value: Int) {
        
        if let root = root {
            
            var node = root
            
            while true {
                
                if value >= node.value {
                    
                    if let rightNode = node.right {
                        node = rightNode
                    } else {
                        node.right = Node(value: value)
                        break
                    }
                    
                } else {
                    
                    if let leftNode = node.left {
                        node = leftNode
                    } else {
                        node.left = Node(value: value)
                        break
                    }
                    
                }
                
            }
            
        } else {
            root = Node(value: value)
        }
        
    }
    
    func binarySearch(value: Int) -> Bool {
        
        var found = false
        
        if let root = root {
            var node: Node! = root
            
            while node != nil {
                found = value == node.value
                
                if found {
                    break
                } else if value > node.value {
                    node = node.right
                } else {
                    node = node.left
                }
            }
        }
        
        return found
        
    }
    
    var min: Int? {
        
        var value: Int? = nil
        
        if let root = root {
            
            var node = root
            
            while node.left != nil {
                node = node.left!
            }
            
            value = node.value
        }
        
        return value
        
    }
    
    var max: Int? {
        var value: Int? = nil
        
        if let root = root {
            
            var node = root
            
            while node.right != nil {
                node = node.right!
            }
            
            value = node.value
        }
        
        return value

    }
    
}

let tree = Tree()
tree.append(value: 10)
tree.append(value: 20)
tree.append(value: 5)

tree.binarySearch(value: 10)
tree.binarySearch(value: 30)
tree.max!
tree.min!
