//
//  DependencyInjection.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 24/01/2024.
//

import Factory

extension Container {
    var serviceA: Factory<ServiceA> {
        Factory(self) { DefaultServiceA() }
    }
    
    var serviceB: Factory<ServiceB> {
        Factory(self) { DefaultServiceB() }
    }
    
    var serviceC: Factory<ServiceC> {
        Factory(self) { DefaultServiceC() }
    }
}
