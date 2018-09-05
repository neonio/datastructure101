import Foundation

public enum FoundationError: Error{
    case overflow
    case dividzero
}

public protocol Testable {
    static func valid() -> Bool
    func testcase() -> [Bool]
}

