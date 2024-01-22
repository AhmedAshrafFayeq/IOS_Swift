//
//  ColorSpecification.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 22/01/2024.
//

import Foundation

class ColorSpecification: Specification {
    typealias T = Product
    let color: Color
    
    init(_ color: Color) {
        self.color = color
    }
    
    func isSatisified(_ item: Product) -> Bool {
        item.color == color
    }
}
