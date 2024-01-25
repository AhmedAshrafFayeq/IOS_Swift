//
//  ViewController.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 21/01/2024.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        print("is empty? ", stack.isEmpty)
        print("the top of stack is: ", stack.top ?? "")
        print("the deleted item is: ", stack.pop() ?? "")

        var stack2: Stack = [3, 2, 1]
        print("is empty? ", stack2.isEmpty)
        print("the top of stack is: ", stack2.top ?? "")
        print("the deleted item is: ", stack2.pop() ?? "")
        print("------------------------")
        print(add(5, 6))
        print("------------------------")
        print("------------------------")
        Task {
            await didTapAnyAction()
        }
    }
    func didTapAnyAction() async {
        await viewModel.didServiceAMagic()
    }
}

extension ViewController {
    func add<T: Numeric> (_ num1: T, _ num2: T) -> T {
        num1 + num2
    }
}
