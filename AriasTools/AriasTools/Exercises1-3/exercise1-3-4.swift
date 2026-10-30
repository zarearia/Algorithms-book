//
//  exercise1-3-4.swift
//  AriasTools
//
//  Created by Aria Zare on 30/10/2026.
//

func parantheses(input: String) -> Bool {
    let stack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    var string = input
    for i in input {
        let value = String(string.removeFirst())
        if i == "[" || i == "(" || i == "{" {
            stack.push(value)
            continue
        }
        
        if i == "]" {
            let isValid = "[" == stack.pop()
            if isValid == false {
                return false
            }
        }
        
        if i == "}" {
            let isValid = "{" == stack.pop()
            if isValid == false {
                return false
            }
        }
        
        if i == ")" {
            let isValid = "(" == stack.pop()
            if isValid == false {
                return false
            }
        }
    }
    
    return stack.isEmpty()
}
