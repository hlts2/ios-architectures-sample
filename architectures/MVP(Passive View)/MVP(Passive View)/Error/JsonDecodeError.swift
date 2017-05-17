import Foundation

enum JsonDecodeError: Error {
    case invalidFormat
    case missingValue(key: String, value: Any?)
}
