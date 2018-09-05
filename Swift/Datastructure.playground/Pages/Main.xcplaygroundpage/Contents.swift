//: [Previous](@previous)

import Foundation

var queue = CircularQueue(capacity: 3, defaultValue: -1)

//queue.dequeue()
queue.enqueue(elem: 4)
queue.enqueue(elem: 2)
queue.enqueue(elem: 2)
queue.enqueue(elem: 2)
queue.enqueue(elem: 2)
queue.dequeue()
queue.dequeue()
//queue.dequeue()
print("\(queue)")
