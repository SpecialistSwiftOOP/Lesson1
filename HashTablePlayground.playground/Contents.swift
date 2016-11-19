//: Playground - noun: a place where people can play

import UIKit

class HashTable {
    
    var data: [[Int]?]
    
    init() {
        data = [[Int]?](repeating: nil, count: 10)
    }
    
    func insert(arr: [Int]) -> Bool {
        
        let position = hash(arr: arr)
        
        let result = data[position] == nil
        
        if result {
            data[position] = arr
        }
        
        return result
    }
    
    func hasArray(arr: [Int]) -> Bool {
        
        let position = hash(arr: arr)
        return data[position] != nil
        
    }
    
    func hash(arr: [Int]) -> Int {
        
        var h = 0
        
        for item in arr {
            h += item
        }
        
        return h % data.count
    }
    
}

let hashTable = HashTable()
hashTable.insert(arr: [5, 10])
hashTable.hasArray(arr: [5, 10])
hashTable.hasArray(arr: [6, 10])
