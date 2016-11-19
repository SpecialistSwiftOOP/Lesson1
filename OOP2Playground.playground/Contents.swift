//: Playground - noun: a place where people can play

import UIKit

enum Request {
    
    case connect(address: String)
    
    case disconnect
    
    case string(string: String)
    
    case number(number: Int)
    
}

class Server {
    
    static func send(request: Request) {
        
        switch request {
            
        case let .connect(address):
            connect(address: address)
            
        case .disconnect:
            disconnect()
            
        case let .string(value):
            send(string: value)
            
        case let .number(value):
            send(number: value)
        }
        
    }
    
    private static func connect(address: String) {
        print("Connecting to \(address)")
    }
    
    private static func send(string: String) {
        print("Sending \(string)")
    }
    
    private static func send(number: Int) {
        print("Sending number \(number)")
    }
    
    private static func disconnect() {
        print("Disconnecting...")
    }
    
}

Server.send(request: .connect(address: "localhost"))
Server.send(request: .string(string: "Hello"))
Server.send(request: .number(number: 19))
Server.send(request: .disconnect)
