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
    //MARK: -Methods
    func didServiceAMagic() async {
        await myServiceA.didServiceAAction()
    }
}

protocol ServiceA {
    func didServiceAAction() async
}
class DefaultServiceA: ServiceA {
    func didServiceAAction() async {
        return await withCheckedContinuation{ continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                print("Hello from Service A")
                continuation.resume()
            }
        }
    }
}

protocol ServiceB {}
class DefaultServiceB: ServiceB {}

protocol ServiceC {}
class DefaultServiceC: ServiceC {}
