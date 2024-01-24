//
//  ViewModel.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 24/01/2024.
//

import Foundation
import Factory

class ViewModel {
    @Injected(\.serviceA) private var myServiceA
    @Injected(\.serviceB) private var myServiceB
    @Injected(\.serviceC) private var myServiceC
    
    func didServiceAMagic() {
        myServiceA.didServiceAAction()
    }
}

protocol ServiceA {
    func didServiceAAction()
}
class DefaultServiceA: ServiceA {
    func didServiceAAction() {
        print("Hello from Service A")
    }
}

protocol ServiceB {}
class DefaultServiceB: ServiceB {}

protocol ServiceC {}
class DefaultServiceC: ServiceC {}
