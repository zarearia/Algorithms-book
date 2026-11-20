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
        if i == "+" || i == "-" || i == "*" || i == "/" {
            operationsStack.push(value)
            continue
        }
        
//        if i == "*" || i == "/"{
//            var lResult = ""
//            lResult.insert(contentsOf: numbersStack.pop() ?? "", at: lResult.startIndex)
//            lResult.insert(contentsOf: numbersStack.pop() ?? "", at: lResult.startIndex)
//            lResult.append(value)
//            numbersStack.push(lResult)
//            continue
//        }
        
        if i.isNumber {
            numbersStack.push(value)
            if operationsStack.peek() == "*" || operationsStack.peek() == "/"{
                var lResult = ""
                lResult.insert(contentsOf: numbersStack.pop() ?? "", at: lResult.startIndex)
                lResult.insert(contentsOf: numbersStack.pop() ?? "", at: lResult.startIndex)
                lResult.append(operationsStack.pop() ?? "")
                numbersStack.push(lResult)
            }
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

func evaluatePostfix(input: String) -> Int {
    let operationsStack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    let numbersStack = FixedCapacityStack<String>(size: input.count, defaultValue: "")
    var string = input
    for i in input {
        let value = String(string.removeFirst())

        if i == "+" || i == "-" || i == "*" || i == "/" {
//            operationsStack.push(value)
            let operation = value
            let secondValue = Int(numbersStack.pop()!)!
            let firstValue = Int(numbersStack.pop()!)!
            
            if operation == "+" {
                numbersStack.push(String(firstValue + secondValue))
            }
            if operation == "-" {
                numbersStack.push(String(firstValue - secondValue))
            }
            if operation == "/" {
                numbersStack.push(String(firstValue / secondValue))
            }
            if operation == "*" {
                numbersStack.push(String(firstValue * secondValue))
            }
        }
        
        if i.isNumber {
            numbersStack.push(value)
            
            continue
        }
    }
    
    return Int(numbersStack.pop()!)!
}


class IterableStackClient {
    static func copy<Item>(stack: FixedCapacityStack<Item>) -> FixedCapacityStack<Item?> {
        let newStack = FixedCapacityStack<Item?>(size: stack.size, defaultValue: nil)
        for i in stack {
            newStack.push(i)
        }
        
        return newStack
    }
}

class KthLastString {
    
    var stack = FixedCapacityStack<String?>(size: 100, defaultValue: nil)

    func standardInput(with input: String) {
        stack.push(input)
    }
    
    func getKth(_ kth: Int) -> String? {
        if kth > stack.size {
            return nil
        }
        let backUpStack = FixedCapacityStack<String?>(size: kth, defaultValue: nil)
        var value: String? = nil
        for _ in 0..<kth {
            value = stack.pop() ?? nil
            backUpStack.push(value)
        }
        
        for _ in 0..<kth {
            stack.push(backUpStack.pop() ?? nil)
        }
        
        return value
    }
}


//1.3.16 and 1.3.17
// since it is generic, date and transaction won't change anything

class ReadAll<Item> {
    var queue = ResizingArrayQueue<Item>()

    func standardInput(with input: Item) {
        queue.enqueue(input)
    }
    
    public func readAllDates() -> [Item?] {
        
        let n = queue.count
        var output: [Item?] = [Item?]()
        for _ in 0..<n {
            output.append(queue.dequeue())
        }
        return output
        
    }
}

//MARK: Linked-Lust Exercises
/////////////////////////////////////

class Node<Item>: {
    var value: Item
    var next: Node<Item>? = nil
    
    init(value: Item) {
        self.value = value
    }
}


func removeLastNode<Item>(first: Node<Item>) {
    var currentNode = first
    var lastNode = currentNode
    while currentNode.next != nil {
        lastNode = currentNode
        if let next = currentNode.next {
            currentNode = next
        }
    }
    
    lastNode.next = nil
}


func delete<Item>(kth: Int, first: Node<Item>) {
    var currentNode: Node<Item>? = first
    var lastNode = currentNode
    for _ in 1..<kth {
        if currentNode == nil {
            break
        }
        lastNode = currentNode
        currentNode = currentNode?.next
    }
    
    lastNode?.next = currentNode?.next
}

func find(first: Node<String>, key: String) -> Bool {
    var currentNode: Node<String>? = first
    while currentNode != nil {
        if currentNode?.value == key {
            return true
        }
        currentNode = currentNode?.next
    }
     
    return false
}

func removeAfter<Item>(node: Node<Item>?) {
    guard (node != nil || node?.next != nil) else {
        return
    }
    
    node?.next = node?.next?.next
}

func insertAfter<Item>(first: Node<Item>?, second: Node<Item>?) {
    guard (first != nil || second != nil) else {
        return
    }
    
    first?.next?.next = second?.next
    first?.next = second
}

func remove(first: Node<String>, key: String) {
    var currentNode: Node<String>? = first
    var oldNode: Node<String>? = first
    
    while currentNode != nil {
        if currentNode?.value == key {
            oldNode?.next = currentNode?.next
        }
        oldNode = currentNode
        currentNode = currentNode?.next
    }
     
}

func max(first: Node<Int>) -> Int {
    var max = 0;
    var currentNode: Node<Int>? = first
    while currentNode != nil {
        if let value = currentNode?.value {
            if value > max {
                max = value
            }
        }
        currentNode = currentNode?.next
    }
    
    return max
}

func recursiveMax(first: Node<Int>?, max: Int = 0) -> Int {
    if first == nil {
        return max
    }
    
    var lmax = max
    if let value = first?.value {
        if value > max {
            lmax = value
        }
    }
    
    return recursiveMax(first: first?.next, max: lmax)
}


func reverse<Item>(first: Node<Item>) -> Node<Item>? {
    var firstNode: Node<Item>? = first
    var count = 0
    while true {
        if let node = firstNode {
            count += 1
            var backupOfNextNode = Node(value: node.next!.value)
            backupOfNextNode.next = node.next
            var secondNode = node.next
            secondNode?.next = firstNode
            if (count == 1) {
                firstNode?.next = nil
            }
            if (backupOfNextNode.next == nil) {
                return secondNode
            }
            firstNode = backupOfNextNode
        }
    }
    return nil
}
