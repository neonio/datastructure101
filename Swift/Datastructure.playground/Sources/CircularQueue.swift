import Foundation

public struct CircularQueue<T:Equatable&CustomDebugStringConvertible>: CustomDebugStringConvertible {
    private var data: [T?] = []
    private var front: Int = 0
    private var tail: Int = 0
    private(set) var itemSize :Int = 0
    private let defaultVal: T
    
    public init(capacity:Int, defaultValue: T ) {
        data = [T](repeating: defaultValue, count: capacity + 1)
        front = 0
        tail = 0
        itemSize = 0
        defaultVal = defaultValue
    }
    
    public mutating func enqueue(elem: T) -> Bool{
        if isFull() {
            enlargeCapacity()
        }
        itemSize += 1
        data[tail] = elem
        tail = (tail + 1) % data.count
        
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        guard !isEmpty() else { return nil }
        itemSize -= 1
        let popItem = data[front]
        data[front] = defaultVal
        front = (front + 1) % data.count
        if itemSize < data.count / 4 {
            shrinkCapacity()
        }
        return popItem
    }
    
    public func isFull() -> Bool {
        return (tail + 1) % data.count == front
    }
    
    public func isEmpty() -> Bool {
        return front == tail
    }
    
    public func headItem() -> T? {
        return itemSize > 0 ? data[front] : defaultVal
    }
    
    public func rearItem() -> T? {
        return itemSize > 0 ? data[(tail - 1 + data.count) % data.count] : defaultVal
    }
    
    private mutating func enlargeCapacity() {
        var newData = [T](repeating: defaultVal, count: data.count * 2 - 1)
        for (index, _) in data.enumerated() {
            newData[index] = data[index] ?? defaultVal
        }
        data = newData
    }
    
    private mutating func shrinkCapacity() {
        var newData = [T](repeating: defaultVal, count: data.count / 2 - 1)
        for (index, _) in newData.enumerated() {
            newData[index] = data[index] ?? defaultVal
        }
        data = newData
    }
    
    public var debugDescription: String {
        let displayQueue = self.data.compactMap({ (elem) -> String in
            return elem.debugDescription ?? defaultVal.debugDescription
        }) 
        return "Circular Queue: front-[ \(displayQueue) ]-end \nCapacity:\(self.data.count) \nFrontElem: \(self.headItem()) RearElem: \(self.rearItem())"
    }
}
