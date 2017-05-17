import Foundation

struct GitSearchResponseData: JsonDecodable {
    
    let items: [Repository]!
    
    init(json: Any) throws {
        
        guard let dict = json as? [String: Any] else {
            throw JsonDecodeError.invalidFormat
        }
        
        guard let itemObj = dict["items"] as? [Any] else {
            throw JsonDecodeError.missingValue(key: "items", value: dict["items"])
        }
        
        self.items = try itemObj.map {
            return try Repository(json: $0)
        }
    }
}
