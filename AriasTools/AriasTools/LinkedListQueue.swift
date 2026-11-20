//
//  LinkedListQueue.swift
//  AriasTools
//
//  Created by Aria Zare on 18/11/2026.
//

import Foundation

class LinkedListQueue<Item> {
    private var lastNode: Node<Item>? = nil
    var count: Int = 0
    
    func enqueue(item: Item) {
        count += 1
        if lastNode == nil {
            lastNode = Node(value: item)
            lastNode?.next = lastNode
            return
        }
        
        let newNode = Node(value: item)
        newNode.next = lastNode?.next
        lastNode?.next = newNode
        lastNode = newNode
    }
    
    func dequeue() -> Item? {
        guard let lastNode else {
            return nil
        }
        
        count -= 1
        
        let output = lastNode.next
        lastNode.next = output?.next
        
        if count == 0 {
            self.lastNode?.next = nil
            self.lastNode = nil
        }
        
        return output?.value
        
    }
}
