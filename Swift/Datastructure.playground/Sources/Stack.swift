import Foundation

//: Stack 栈

public struct Stack<T:Comparable&CustomDebugStringConvertible>:CustomDebugStringConvertible {
    private var data: [T] = []
    
    public var size: Int {
        return data.count
    }
    
    public init(list:[T]) {
        data = list
    }
    
    public init() {}
    
    public mutating func push(elem: T) {
        data.append(elem)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return data.popLast()
    }
    
    public func peek() -> T? {
        return data.last
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    public var debugDescription: String {
        let displayStr:String = data.enumerated().reduce("") { (temp, iter) -> String in
            return temp + iter.element.debugDescription + (iter.offset == size - 1 ? "" : ", ")
        }
        
        return "Stack: bottom-[ \(displayStr) ]-top"
    }
}


