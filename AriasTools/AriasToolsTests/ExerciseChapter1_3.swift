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
    
}
