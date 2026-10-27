//
//  AriasArray.swift
//  AriasTools
//
//  Created by Aria Zare on 27/10/2026.
//


struct AriasArray<Item> {
    let size: Int
    private let unsafeBuffer: UnsafeMutableBufferPointer<Item>
    private let arrayDeleter: ArrayDeleter
    
    init(size: Int) {
        self.size = size
        unsafeBuffer = UnsafeMutableBufferPointer<Item>.allocate(capacity: size)
        arrayDeleter = ArrayDeleter(unsafeBuffer: unsafeBuffer)
    }
    
    private class ArrayDeleter {
        let unsafeBuffer: UnsafeMutableBufferPointer<Item>
        
        init(unsafeBuffer: UnsafeMutableBufferPointer<Item>) {
            self.unsafeBuffer = unsafeBuffer
        }
        
        deinit {
            self.unsafeBuffer.deallocate()
        }
    }
    
}
