//
//  Stack.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 21/01/2024.
//

import Foundation

struct Stack <T> {
    var storage: [T] = []
    
    var top: T? {
        storage.last
    }
    
    var isEmpty: Bool {
        top == nil
    }
    mutating func push(_ element: T) {
        storage.append(element)
    }
    mutating func pop()-> T? {
        storage.popLast()
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        storage = elements
    }
}
