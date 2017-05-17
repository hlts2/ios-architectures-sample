import Foundation

enum HttpResult<T, Error: Swift.Error> {
    case success(value: T)
    case failure(value: Error)
    
    init(value: T) {
        self = .success(value: value)
    }
    
    init(value: Error) {
        self = .failure(value: value)
    }
}
