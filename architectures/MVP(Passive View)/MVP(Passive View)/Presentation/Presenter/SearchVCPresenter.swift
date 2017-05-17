import Foundation

protocol ISearchVCPresenter {
    init(viewInput: ISearchVC)
    
    func setKeyboardShowNotification()
    func searchRepositoriesList(keyword: String)
    func getRepositoriesCount() -> Int
    func getgetRepositoriesItem(index: Int) -> Repository
}

class SearchVCPresenter: ISearchVCPresenter {
    fileprivate var viewInput: ISearchVC!
    fileprivate var repositories = [Repository]()
    fileprivate var githubItemRepository: IGithubItemRepository = GithubItemRepository()
    
    required init(viewInput: ISearchVC) {
        self.viewInput = viewInput
    }
    
    func setKeyboardShowNotification() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardShowNotification), name: .UIKeyboardWillShow, object: nil)
    }
    
    @objc func keyboardShowNotification() {
        viewInput.showCancelButtonIntoSearchBar()
    }
    
    func searchRepositoriesList(keyword: String) {
        githubItemRepository.fetchRepositories(keyword) { data in
            self.repositories = data
            self.viewInput.tableReflesh()
        }
    }
    
    func getgetRepositoriesItem(index: Int) -> Repository {
        return repositories[index]
    }
    
    func getRepositoriesCount() -> Int{
        return repositories.count
    }
}
