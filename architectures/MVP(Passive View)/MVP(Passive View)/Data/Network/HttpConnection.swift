import Foundation

struct HttpConnection {
    
    private let session: URLSession = {
        let conf = URLSessionConfiguration.default
        return URLSession(configuration: conf)
    }()
    
    //Execute Json Requeset Type
    func execute<T: Request>(request: T, completion: @escaping (_ result: HttpResult<T.Response,HttpClientError>) -> Void) where T: RequestTypeJson {
        let urlRequest = request.createRequest()
        
        session.dataTask(with: urlRequest) { data, resp, error in
            switch (data, resp, error) {
            case(_, _, let error?):
                completion(.failure(value: HttpClientError.connectionError(error)))
            case(let data?, let resp?, _):
                do {
                    if case (200...300)? = (resp as? HTTPURLResponse)?.statusCode {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        completion(.success(value: try T.Response(json: json)))
                    }
                } catch {
                    completion(.failure(value: HttpClientError.responseParseError(error)))
                }
                
            default:
                fatalError("予期せぬエラー")
            }
        }.resume()
    }
}
