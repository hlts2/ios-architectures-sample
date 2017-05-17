import Foundation

protocol IGithubItemRepository {
    func fetchRepositories(_ word: String, completion: @escaping (_ data: [Repository]) -> ())
}

class GithubItemRepository: IGithubItemRepository {
    
    func fetchRepositories(_ word: String, completion: @escaping (_ data: [Repository]) -> ()) {
        HttpConnection().execute(request: ApiType.Github.SearchRepositories(keyword: word)) { result in
            switch result {
            case .success(let response):
                completion(response.items)
            case .failure(let err):
                print(err)
            }
        }
    }
}
