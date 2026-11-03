//
//  ResizableStack.swift
//  AriasTools
//
//  Created by Aria Zare on 03/11/2026.
//
//TODO: Implement this
//class ResizableStack<Item> {
//    
//    private var itemsArray: AriasArray<Item>
//    private var n: Int = 0
//    var size: Int = 0
//    
//    
//    init() {
//        self.itemsArray = AriasArray(size: size, defaultValue: defaultValue)
//    }
//    
//    func push(_ item: Item) {
//        if isFull() {
//            print("[FixedCapacityStack] stack is full")
//            return
//        }
//        
//        self.itemsArray[n] = item
//        n += 1
//    }
//    
//    func resizeArray()
//    
//    func pop() -> Item? {
//        if n <= 0 {
//            print("[FixedCapacityStack] stack is empty")
//            return nil
//        }
//        let item = self.itemsArray[n-1];
//        n -= 1
//        return item
//    }
//    
//    func peek() -> Item? {
//        if n <= 0 {
//            print("[FixedCapacityStack] stack is empty")
//            return nil
//        }
//        return self.itemsArray[n-1];
//    }
//
//    func isEmpty() -> Bool {
//        return n == 0
//    }
//    
//    func isFull() -> Bool {
//        return n == size
//    }
//}
