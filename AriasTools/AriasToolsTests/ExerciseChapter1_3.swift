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

    @Test func starts_empty() {
        let q = ResizingArrayQueue<Int>()
        #expect(q.count == 0)
    }

    @Test func single_item() {
        let q = ResizingArrayQueue<Int>()
        q.enqueue(7)
        #expect(q.count == 1)
        #expect(q.dequeue() == 7)
        #expect(q.count == 0)
    }

    @Test func fifo_order() {
        let q = ResizingArrayQueue<Int>()
        for v in 1...10 { q.enqueue(v) }
        #expect(q.count == 10)
        for v in 1...10 {
            #expect(q.dequeue() == v, "FIFO violated at \(v)")
        }
        #expect(q.count == 0)
    }

    @Test func grows_well_beyond_initial_capacity() {
        let q = ResizingArrayQueue<Int>()
        let values = Array(1...100)
        for v in values { q.enqueue(v) }
        #expect(q.count == 100)
        for v in values {
            #expect(q.dequeue() == v, "FIFO violated at \(v)")
        }
        #expect(q.count == 0)
    }

    @Test func enqueue_after_full_drain() {
        let q = ResizingArrayQueue<Int>()
        q.enqueue(1); q.enqueue(2); q.enqueue(3)
        #expect(q.dequeue() == 1)
        #expect(q.dequeue() == 2)
        #expect(q.dequeue() == 3)
        q.enqueue(4); q.enqueue(5)
        #expect(q.dequeue() == 4)
        #expect(q.dequeue() == 5)
        #expect(q.count == 0)
    }

    @Test func interleaved_enqueue_dequeue_keeps_order() {
        let q = ResizingArrayQueue<String>()
        var expected: [String] = []
        var next = 0
        for _ in 0..<50 {
            for _ in 0..<3 {
                let s = "item\(next)"; next += 1
                q.enqueue(s); expected.append(s)
            }
            for _ in 0..<2 {
                #expect(q.dequeue() == expected.removeFirst())
            }
            #expect(q.count == expected.count)
        }
        while !expected.isEmpty {
            #expect(q.dequeue() == expected.removeFirst())
        }
        #expect(q.count == 0)
    }

    @Test func stress_mixed_operations_against_array_model() {
        let q = ResizingArrayQueue<Int>()
        var model = [Int]()
        var next = 0
        for i in 0..<1000 {
            if model.isEmpty || i % 3 != 0 {
                q.enqueue(next); model.append(next); next += 1
            } else {
                #expect(q.dequeue() == model.removeFirst())
            }
            #expect(q.count == model.count, "count drifted at step \(i)")
        }
    }
    
    @Test func dequeue_on_empty_returns_nil() {
        let q = ResizingArrayQueue<Int>()
        #expect(q.dequeue() == nil)
        q.enqueue(1)
        #expect(q.dequeue() == 1)
        #expect(q.dequeue() == nil)
        #expect(q.count == 0)
    }

    @Test func shrink_after_draining_most_items() {
        let q = ResizingArrayQueue<Int>()
        for v in 1...32 { q.enqueue(v) }        // forces several grows
        #expect(q.count == 32)
        for v in 1...30 {                        // drain to 2 items → shrink branch
            #expect(q.dequeue() == v, "FIFO violated at \(v)")
        }
        #expect(q.count == 2)
        #expect(q.dequeue() == 31)
        #expect(q.dequeue() == 32)
        #expect(q.count == 0)
        #expect(q.dequeue() == nil)
    }

    @Test func order_preserved_after_shrink_then_refill() {
        let q = ResizingArrayQueue<String>()
        for s in ["a","b","c","d","e","f","g","h"] { q.enqueue(s) }
        #expect(q.dequeue() == "a")
        #expect(q.dequeue() == "b")
        #expect(q.dequeue() == "c")
        #expect(q.dequeue() == "d")
        #expect(q.dequeue() == "e")
        #expect(q.dequeue() == "f")             // count now 2 → shrink territory
        q.enqueue("x"); q.enqueue("y"); q.enqueue("z")
        #expect(q.dequeue() == "g")
        #expect(q.dequeue() == "h")
        #expect(q.dequeue() == "x")
        #expect(q.dequeue() == "y")
        #expect(q.dequeue() == "z")
        #expect(q.dequeue() == nil)
    }

    @Test func repeated_grow_and_shrink_cycles() {
        let q = ResizingArrayQueue<Int>()
        var model = [Int]()
        var next = 0
        for _ in 0..<20 {
            for _ in 0..<10 {
                q.enqueue(next); model.append(next); next += 1
            }
            for _ in 0..<9 {
                #expect(q.dequeue() == model.removeFirst())
            }
            #expect(q.count == model.count)
        }
        while !model.isEmpty {
            #expect(q.dequeue() == model.removeFirst())
        }
        #expect(q.count == 0)
    }

    @Test func stress_grow_shrink_against_model() {
        let q = ResizingArrayQueue<Int>()
        var model = [Int]()
        var next = 0
        for i in 0..<2000 {
            if model.count < 8 || i % 5 != 0 {
                q.enqueue(next); model.append(next); next += 1
            } else if !model.isEmpty {
                #expect(q.dequeue() == model.removeFirst())
            }
            #expect(q.count == model.count, "count drifted at step \(i)")
        }
        while !model.isEmpty {
            #expect(q.dequeue() == model.removeFirst())
        }
        #expect(q.count == 0)
    }
}


struct KthLastStringTests {

    @Test func empty_input_returns_nil() {
        let kth = KthLastString()
        #expect(kth.getKth(1) == nil)
    }

    @Test func single_input() {
        let kth = KthLastString()
        kth.standardInput(with: "hello")
        #expect(kth.getKth(1) == "hello")
    }
    
    @Test func kth_from_last_with_ten_inputs() {
        let kth = KthLastString()
        let inputs = ["a","b","c","d","e","f","g","h","i","j"]
        for s in inputs { kth.standardInput(with: s) }

        #expect(kth.getKth(1) == "j")
        #expect(kth.getKth(2) == "i")
        #expect(kth.getKth(5) == "f")
        #expect(kth.getKth(10) == "a")

        // stack was NOT consumed: same answers on repeat, and new input still works
        #expect(kth.getKth(10) == "a")
        #expect(kth.getKth(1) == "j")
        kth.standardInput(with: "k")
        #expect(kth.getKth(11) == "a")
        #expect(kth.getKth(1) == "k")
    }

    @Test func k_out_of_range_returns_nil_but_keeps_stack() {
        let kth = KthLastString()
        kth.standardInput(with: "x")
        kth.standardInput(with: "y")
        #expect(kth.getKth(3) == nil)
        #expect(kth.getKth(0) == nil)
        // failed lookups must not have removed anything
        #expect(kth.getKth(1) == "y")
        #expect(kth.getKth(2) == "x")
    }

    @Test func getKth_does_not_consume_input() {
        let kth = KthLastString()
        kth.standardInput(with: "a")
        kth.standardInput(with: "b")
        kth.standardInput(with: "c")
        #expect(kth.getKth(2) == "b")
        #expect(kth.getKth(2) == "b")    // same answer on repeat call
        #expect(kth.getKth(1) == "c")
        #expect(kth.getKth(3) == "a")    // all three still present
    }

    @Test func interleaved_calls() {
        let kth = KthLastString()
        kth.standardInput(with: "one")
        #expect(kth.getKth(1) == "one")
        kth.standardInput(with: "two")
        #expect(kth.getKth(1) == "two")
        #expect(kth.getKth(2) == "one")   // "one" still there after previous getKth
        kth.standardInput(with: "three")
        #expect(kth.getKth(3) == "one")
        #expect(kth.getKth(2) == "two")
        #expect(kth.getKth(1) == "three")
    }
}

struct ReadAllTests {

    @Test func empty_returns_empty_array() {
        let reader = ReadAll<Int>()
        #expect(reader.readAllDates().isEmpty)
    }

    @Test func single_input() {
        let reader = ReadAll<String>()
        reader.standardInput(with: "hello")
        #expect(reader.readAllDates() == ["hello"])
    }

    @Test func multiple_inputs_come_out_in_fifo_order() {
        let reader = ReadAll<Int>()
        let inputs = [5, 3, 8, 1, 9, 2]
        for i in inputs { reader.standardInput(with: i) }
        #expect(reader.readAllDates() == inputs)
    }

    @Test func larger_input_set() {
        let reader = ReadAll<Int>()
        let inputs = Array(1...50)
        for i in inputs { reader.standardInput(with: i) }
        #expect(reader.readAllDates() == inputs)
    }

    @Test func readAll_consumes_the_queue() {
        let reader = ReadAll<String>()
        reader.standardInput(with: "a")
        reader.standardInput(with: "b")
        #expect(reader.readAllDates() == ["a", "b"])
        #expect(reader.readAllDates().isEmpty)   // second read gets nothing
    }

    @Test func interleaved_input_and_read() {
        let reader = ReadAll<Int>()
        reader.standardInput(with: 1)
        reader.standardInput(with: 2)
        #expect(reader.readAllDates() == [1, 2])
        reader.standardInput(with: 3)
        reader.standardInput(with: 4)
        #expect(reader.readAllDates() == [3, 4])
        #expect(reader.readAllDates().isEmpty)
    }
}
