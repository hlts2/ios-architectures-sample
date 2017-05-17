import Foundation

struct Repository: JsonDecodable {
    let name: String
    let full_name: String
    let html_url: String
    
    init(json: Any) throws {
        guard let dict = json as? [String: Any] else {
            throw JsonDecodeError.invalidFormat
        }
        
        guard let name = dict["name"] as? String else {
            throw JsonDecodeError.missingValue(key: "name", value: dict["name"])
        }
        
        guard let full_name = dict["full_name"] as? String else {
            throw JsonDecodeError.missingValue(key: "full_name", value: dict["full_name"])
        }
        
        guard let html_url = dict["html_url"] as? String else {
            throw JsonDecodeError.missingValue(key: "html_url", value:  dict["html_url"])
        }
        
        self.name = name
        self.full_name = full_name
        self.html_url = html_url
    }
    
}
