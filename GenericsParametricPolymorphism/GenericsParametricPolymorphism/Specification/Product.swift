//
//  Product.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 22/01/2024.
//

import Foundation
class Product {
    let name: String
    let color: Color
    
    init(name: String, color: Color) {
        self.name = name
        self.color = color
    }
}

enum Color {
    case red
    case green
    case blue
}
