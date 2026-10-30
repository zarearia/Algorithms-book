//
//  FixedCapacityStack.swift
//  AriasTools
//
//  Created by Aria Zare on 29/10/2026.
//

class FixedCapacityStack<Item> {
    
    private var itemsArray: AriasArray<Item>
    private var n: Int = 0
    var size: Int = 0
    
    
    init(size: Int, defaultValue: Item) {
        self.size = size
        self.itemsArray = AriasArray(size: size, defaultValue: defaultValue)
    }
    
    func push(_ item: Item) {
        if isFull() {
            print("[FixedCapacityStack] stack is full")
            return
        }
        
        self.itemsArray[n] = item
        n += 1
    }
    
    func pop() -> Item? {
        if n <= 0 {
            print("[FixedCapacityStack] stack is empty")
            return nil
        }
        let item = self.itemsArray[n-1];
        n -= 1
        return item
    }
    
    func isEmpty() -> Bool {
        return n == 0
    }
    
    func isFull() -> Bool {
        return n == size
    }
}
