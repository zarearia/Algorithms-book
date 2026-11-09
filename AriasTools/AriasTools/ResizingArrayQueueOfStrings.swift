//
//  ResizingArrayQueueOfStrings.swift
//  AriasTools
//
//  Created by Aria Zare on 09/11/2026.
//

class ResizingArrayQueueOfStrings<Item> {
    private var itemsArray: AriasArray<Item>
    private var tail: Int = 0
    private var head: Int = 0
    var size: Int = 0
    
    //TODO: I'm not ok with having this defaultValue, find a way to fix it
    init(size: Int, defaultValue: Item) {
        self.size = size
        self.itemsArray = AriasArray(size: size, defaultValue: defaultValue)
    }
    
    func enqueue(_ item: Item) {
        itemsArray[tail] = item
        tail += 1
    }
    
    func dequeue() -> Item {
        let item = itemsArray[head]
        head += 1
        return item
    }
    
    func isEmpty() -> Bool {
        return head == tail
    }
    
    func isFull() -> Bool {
        return tail - head == size
    }
    
}
