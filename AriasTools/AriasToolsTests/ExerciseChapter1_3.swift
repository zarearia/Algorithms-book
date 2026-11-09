//
//  AriasToolsTests.swift
//  AriasToolsTests
//
//  Created by Aria Zare on 29/10/2026.
//

import Testing
@testable import AriasTools

struct AriasToolsTests {
    
    @Test func one() async throws {
        let fixedCapacityStack = FixedCapacityStack(size: 5, defaultValue: 0)
        print(fixedCapacityStack.isEmpty())
        fixedCapacityStack.push(0)
        fixedCapacityStack.push(1)
        fixedCapacityStack.push(2)
        fixedCapacityStack.push(3)
        print(fixedCapacityStack.size)
        print(fixedCapacityStack.isEmpty())
        print(fixedCapacityStack.isFull())
        fixedCapacityStack.push(4)
        print(fixedCapacityStack.isFull())
        fixedCapacityStack.push(5)
        print(fixedCapacityStack.isFull())
    }
    
    @Test func one_three_four() {
        #expect(parantheses(input: ""))
        #expect(parantheses(input: "()"))
        #expect(parantheses(input: "[]"))
        #expect(parantheses(input: "{}"))
        #expect(parantheses(input: "()[]"))
        #expect(parantheses(input: "(){}"))
        #expect(parantheses(input: "[]{}"))
        #expect(parantheses(input: "()[]{}"))
        #expect(parantheses(input: "{}[]()"))
        #expect(parantheses(input: "{[()]}"))
        #expect(parantheses(input: "([]{})"))
        #expect(parantheses(input: "({[]})"))
        #expect(parantheses(input: "{()[]}"))
        #expect(parantheses(input: "[({})]"))
        #expect(parantheses(input: "(()())"))
        #expect(parantheses(input: "{[()()]}"))
        #expect(parantheses(input: "{[()()()]}"))
        #expect(parantheses(input: "[[[{{{((()))}}}]]]"))
        #expect(parantheses(input: "()()()()"))
        #expect(parantheses(input: "({[]})()"))
        #expect(parantheses(input: "()[]{}()[]{}"))
        #expect(parantheses(input: "([])({})[[]]"))
        #expect(parantheses(input: "((())){}[()]"))
        #expect(parantheses(input: "{[()]}{[()]}{[()]}"))
        #expect(parantheses(input: "((((()))))"))
        #expect(parantheses(input: "({[()]})({[()]})"))
        
        #expect(!parantheses(input: "("))
        #expect(!parantheses(input: ")"))
        #expect(!parantheses(input: "([)]"))
        #expect(!parantheses(input: "{[}]"))
        #expect(!parantheses(input: ")("))
        #expect(!parantheses(input: "())"))
        #expect(!parantheses(input: "(()"))
        #expect(!parantheses(input: ")("))
        #expect(!parantheses(input: "]"))
        #expect(!parantheses(input: ")("))
        #expect(!parantheses(input: "(()]("))
        #expect(!parantheses(input: "((((((((("))
        #expect(!parantheses(input: "()(){"))
        #expect(!parantheses(input: "{[()]}("))
        #expect(!parantheses(input: "{[()]}["))
        #expect(!parantheses(input: "([)]{}"))
        #expect(!parantheses(input: "[][])("))
        #expect(!parantheses(input: "([)"))
        #expect(!parantheses(input: "()[}"))
    }

    @Test func one_three_nine() {
        #expect(infixParantheses(input: "1+2)") == "(1+2)")
        #expect(infixParantheses(input: "1+2)*3-4)*5-6)))") == "((1+2)*((3-4)*(5-6)))")
        #expect(infixParantheses(input: "7-2}") == "{7-2}")
        #expect(infixParantheses(input: "1+2)*3]") == "[(1+2)*3]")
    }
    
    
    @Test func one_three_ten() {
        #expect(infixToPostfix(input: "1") == "1")
        #expect(infixToPostfix(input: "1+2") == "12+")
        #expect(infixToPostfix(input: "1+2*3") == "123*+")
        #expect(infixToPostfix(input: "1*2+3") == "12*3+")
        #expect(infixToPostfix(input: "1+2+3+4") == "1234+++")
        #expect(infixToPostfix(input: "8/4-1") == "84/1-")
    }
    
    @Test func evaluate_postfix() {
        #expect(evaluatePostfix(input: "1") == 1)
        #expect(evaluatePostfix(input: "12+") == 3)
        #expect(evaluatePostfix(input: "123*+") == 7)
        #expect(evaluatePostfix(input: "12*3+") == 5)
        #expect(evaluatePostfix(input: "12+3*") == 9)
        #expect(evaluatePostfix(input: "923*-") == 3)
        #expect(evaluatePostfix(input: "12+3+4+") == 10)
        #expect(evaluatePostfix(input: "234+*5*") == 70)
        #expect(evaluatePostfix(input: "12+34-56-**") == 3)
        #expect(evaluatePostfix(input: "84/1-") == 1)
        #expect(evaluatePostfix(input: "731--") == 5)
        #expect(evaluatePostfix(input: "82-31+/") == 1)   // integer division: 6/4 == 1
        #expect(evaluatePostfix(input: "23-") == -1)        // negative result
        #expect(evaluatePostfix(input: "52/") == 2)         // integer division truncates
        #expect(evaluatePostfix(input: "99*") == 81)
    }
    
    // evaluate the print to see it works
    @Test func copy_on_iterable() {
        let stack = FixedCapacityStack(size: 10, defaultValue: "")
        stack.push("1")
        stack.push("2")
        stack.push("3")
        stack.push("4")
        stack.push("5")
        stack.push("6")
        stack.push("7")
        
        for item in stack {
            print(item)
        }
        
        let stack2 = IterableStackClient.copy(stack: stack)
        stack.pop()
        stack.pop()
        stack.pop()
        stack.pop()
        for item in stack2 {
            print(item)
        }
        
        for item in stack {
            print(item)
        }

    }
}


struct ResizingArrayQueueOfStringsTests {

    @Test func empty_queue() {
        let q = ResizingArrayQueueOfStrings<Int>(size: 3, defaultValue: 0)
        #expect(q.isEmpty())
        #expect(!q.isFull())
    }

    @Test func fifo_order_over_many_items() {
        let q = ResizingArrayQueueOfStrings<Int>(size: 10, defaultValue: 0)
        let values = Array(1...10)
        for v in values { q.enqueue(v) }
        #expect(q.isFull())
        for v in values {
            #expect(q.dequeue() == v, "FIFO violated at \(v)")
        }
        #expect(q.isEmpty())
    }

    @Test func fills_up_to_capacity() {
        let q = ResizingArrayQueueOfStrings<Int>(size: 2, defaultValue: -1)
        q.enqueue(1)
        #expect(!q.isFull())
        q.enqueue(2)
        #expect(q.isFull())
    }

    @Test func interleaved_operations() {
        let q = ResizingArrayQueueOfStrings<String>(size: 4, defaultValue: "")
        q.enqueue("a"); q.enqueue("b")
        #expect(q.dequeue() == "a")
        #expect(q.dequeue() == "b")
        #expect(q.isEmpty())
    }
}
