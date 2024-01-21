//
//  ViewController.swift
//  GenericsParametricPolymorphism
//
//  Created by Ahmed Fayek on 21/01/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        print("is empty? ", stack.isEmpty)
        print("the top of stack is: ", stack.top ?? "")
        
        print("the deleted item is: ", stack.pop() ?? "")
        
        
        var stack2: Stack = [3,2,1]
        print("is empty? ", stack2.isEmpty)
        print("the top of stack is: ", stack2.top ?? "")
        
        print("the deleted item is: ", stack2.pop() ?? "")
        
    }
}
