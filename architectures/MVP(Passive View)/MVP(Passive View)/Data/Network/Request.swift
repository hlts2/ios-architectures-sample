import Foundation

protocol Request {
    var baseUrl: URL { get }
    var path: String { get }
    var method: HttpMethod { get }
    var params: [String: String] { get }
}

extension Request {
    
    func createRequest() -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        urlComponent?.queryItems = params.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
        
        var urlRequest = URLRequest(url: (urlComponent?.url!)!)
        urlRequest.httpMethod  = self.method.rawValue

        return urlRequest
    }
}

protocol RequestTypeJson {
    associatedtype Response: JsonDecodable
}
