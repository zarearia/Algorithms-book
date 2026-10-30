//
//  exercise1-3-4.swift
//  AriasTools
//
//  Created by Aria Zare on 30/10/2026.
//

func parantheses(input: String) -> Bool {
    let stack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    for i in input {
        if i == "[" || i == "(" || i == "{" {
            stack.push(String(input.dropFirst()))
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
