import Foundation

//: Queue 队列

public struct Queue<T:Equatable&CustomDebugStringConvertible>:CustomDebugStringConvertible {
    private var data: [T] = []
    
    public var size: Int {
        return data.count
    }
    
    public init(list:[T]) {
        data = list
    }
    
    public init() {}
    
    public mutating func enqueue(elem: T) {
        data.append(elem)
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        return data.remove(at: 0)
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    public func getHead() -> T? {
        return size > 0 ? data[0] : nil
    }
    
    public var debugDescription: String {
        let displayStr:String = data.enumerated().reduce("") { (temp, iter) -> String in
            return temp + iter.element.debugDescription + (iter.offset == size - 1 ? "" : ", ")
        }
        
        return "Queue: front-[ \(displayStr) ]-end"
    }
}

