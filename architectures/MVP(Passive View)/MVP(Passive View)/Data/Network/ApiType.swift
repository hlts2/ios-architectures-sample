import Foundation

struct ApiType {
    struct Github {
        struct SearchRepositories: Request, RequestTypeJson {
            typealias Response = GitSearchResponseData
            
            var keyword: String
            
            var baseUrl: URL {
                get {
                    return URL(string: "https://api.github.com/")!
                }
            }
            
            var path: String {
                get {
                    return "search/repositories"
                }
            }
            
            var method: HttpMethod {
                get {
                    return .GET
                }
            }
            
            var params: [String: String] {
                return ["q": keyword]
            }
        }
    }
    
}
