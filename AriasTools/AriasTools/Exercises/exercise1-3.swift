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

func infixParantheses(input: String) -> String {
    let operationsStack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    let resultsStack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    var string = input
    for i in input {
        let value = String(string.removeFirst())
        if i == "+" || i == "*" || i == "-" {
            operationsStack.push(value)
            continue
        }
        
        if i.isNumber {
            resultsStack.push(value)
            continue
        }
        
        var resultString = ""
        
        if i == "]" {
            resultString.insert("]", at: resultString.startIndex)
            resultString.insert(contentsOf: resultsStack.pop()!, at: resultString.startIndex)
            resultString.insert(contentsOf: operationsStack.pop()!, at: resultString.startIndex)
            resultString.insert(contentsOf: resultsStack.pop()!, at: resultString.startIndex)
            resultString.insert("[", at: resultString.startIndex)
            resultsStack.push(resultString)
            continue
        }
        
        if i == "}" {
            resultString.insert("}", at: resultString.startIndex)
            resultString.insert(contentsOf: resultsStack.pop()!, at: resultString.startIndex)
            resultString.insert(contentsOf: operationsStack.pop()!, at: resultString.startIndex)
            resultString.insert(contentsOf: resultsStack.pop()!, at: resultString.startIndex)
            resultString.insert("{", at: resultString.startIndex)
            resultsStack.push(resultString)
            continue
        }
        
        if i == ")" {
            resultString.insert(")", at: resultString.startIndex)
            resultString.insert(contentsOf: resultsStack.pop()!, at: resultString.startIndex)
            resultString.insert(contentsOf: operationsStack.pop()!, at: resultString.startIndex)
            resultString.insert(contentsOf: resultsStack.pop()!, at: resultString.startIndex)
            resultString.insert("(", at: resultString.startIndex)
            resultsStack.push(resultString)
            continue
        }
    }
    
    return resultsStack.pop()!
}


func infixToPostfix(input: String) -> String {
    let operationsStack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    let numbersStack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    var result = ""
    var string = input
    for i in input {
        let value = String(string.removeFirst())
        if i == "+" || i == "*" || i == "-" {
            operationsStack.push(value)
            continue
        }
        
        if i.isNumber {
            numbersStack.push(value)
            continue
        }
    }
    
    while !operationsStack.isEmpty() {
        result.append(operationsStack.pop() ?? "")
    }
    
    while !numbersStack.isEmpty() {
        result.insert(contentsOf: numbersStack.pop() ?? "", at: result.startIndex)
    }
    
    return result
}
