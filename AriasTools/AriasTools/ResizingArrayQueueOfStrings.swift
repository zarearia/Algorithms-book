//
//  ResizingArrayQueueOfStrings.swift
//  AriasTools
//
//  Created by Aria Zare on 09/11/2026.
//

class ResizingArrayQueueOfStrings<Item> {
    private var itemsArray: AriasArray<Item?>
    private var tail: Int = 0
    private var head: Int = 0
    private var arraySize: Int = 2
    var count: Int = 0
    
    //TODO: I'm not ok with having this defaultValue, find a way to fix it
    init() {
        self.itemsArray = AriasArray<Item?>(size: arraySize, defaultValue: nil)
    }
    
    func enqueue(_ item: Item) {
        resizeIfNeeded()
        itemsArray[tail] = item
        tail += 1
        count += 1
    }
    
    func dequeue() -> Item? {
        let item = itemsArray[head]
        head += 1
        count -= 1
        resizeIfNeeded()
        return item
//        if let item {
//            return item
//        } else {
//            fatalError()
//        }
    }
    
    private func resizeIfNeeded() {
        
        if (tail >= arraySize && head != tail) {
            var newArray: AriasArray<Item?>
            if count >= arraySize {
                //resizing
                arraySize *= 2
                newArray = AriasArray<Item?>(size: arraySize, defaultValue: nil)
                for i in head..<tail {
                    newArray[i] = itemsArray[i]
                }
            }
//            if count <= arraySize / 4 {
//                //resizing
//                print("HERE")
//                arraySize /= 4
//                newArray = AriasArray<Item?>(size: arraySize, defaultValue: nil)
//                for i in head..<tail {
//                    newArray[i - head] = itemsArray[i]
//                }
//                
//                let oldHead = head
//                head = 0
//                tail -= oldHead
//            }
            else {
                //rearranging
                newArray = AriasArray<Item?>(size: arraySize, defaultValue: nil)
                for i in head..<tail {
                    newArray[i - head] = itemsArray[i]
                }
                
                let oldHead = head
                head = 0
                tail -= oldHead
            }
            

            itemsArray = newArray
        }
    }
    
    
//    func isEmpty() -> Bool {
//        return head == tail
//    }
//    
//    func isFull() -> Bool {
//        return tail - head == arraySize
//    }
    
}
