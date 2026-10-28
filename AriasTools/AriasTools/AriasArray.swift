//
//  AriasArray.swift
//  AriasTools
//
//  Created by Aria Zare on 27/10/2026.
//

// TODO: Add copy on write
// TODO: Add swift collection methods like map, filter, ...
struct AriasArray<Item> {
    let size: Int
    private let unsafeBuffer: UnsafeMutableBufferPointer<Item>
    private let arrayDeleter: ArrayDeleter
    
    init(size: Int, defaultValue: Item) {
        self.size = size
        unsafeBuffer = UnsafeMutableBufferPointer<Item>.allocate(capacity: size)
        unsafeBuffer.initialize(repeating: defaultValue)
        arrayDeleter = ArrayDeleter(unsafeBuffer: unsafeBuffer)
    }
    
    private class ArrayDeleter {
        let unsafeBuffer: UnsafeMutableBufferPointer<Item>
        
        init(unsafeBuffer: UnsafeMutableBufferPointer<Item>) {
            self.unsafeBuffer = unsafeBuffer
        }
        
        deinit {
            self.unsafeBuffer.deinitialize()
            self.unsafeBuffer.deallocate()
        }
    }
    
    subscript(position: Int) -> Item {
        set {
            guard (position >= 0 && position < size) else {
                fatalError("[AriasArray] Index out of range")
            }
            unsafeBuffer.baseAddress?.advanced(by: position).pointee = newValue
        }
        get {
            guard (position >= 0 && position < size) else {
                fatalError("[AriasArray] Index out of range")
            }
            let item = unsafeBuffer.baseAddress?.advanced(by: position).pointee
            if let item {
                return item
            } else {
                fatalError("[AriasArray] Item does not exist in the array")
            }
        }
    }
    
}
