import  Foundation

enum HttpClientError: Error {
    case connectionError(Error)
    case responseParseError(Error)
}
