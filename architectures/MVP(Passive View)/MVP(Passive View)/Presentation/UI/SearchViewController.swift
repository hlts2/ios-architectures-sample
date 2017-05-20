import UIKit

protocol ISearchVC {
    func showCancelButtonIntoSearchBar()
    func tableReflesh()
}

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: CustomSearchBar!
    @IBOutlet weak var repositoryList: RepositoryTable!
    fileprivate lazy var presenter: ISearchVCPresenter = {
        return SearchVCPresenter(viewInput: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        repositoryList.delegate = self
        repositoryList.dataSource = self
        searchBar.delegate = self
        
        repositoryList.register(UINib(nibName: "RepositoryTableCell", bundle: nil), forCellReuseIdentifier: "Cell")
        repositoryList.hiddenEmptyCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.setKeyboardShowNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension SearchViewController: ISearchVC {
    func showCancelButtonIntoSearchBar() {
        self.searchBar.searchOn()
    }
    
    func tableReflesh() {
         self.repositoryList.reloadData()
    }
}

//TableView Delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getRepositoriesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.repositoryList.dequeueReusableCell(withIdentifier: "Cell") as! RepositoryTableCell
        let item = self.presenter.getgetRepositoriesItem(index: indexPath.row)
        
        cell.repositoryNameLabel.text = item.full_name
        cell.repositoryUrlLabel.text = item.html_url
        
        return cell
    }
}

//Search Bar Delegate And Keyboard Notification
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter.searchRepositoriesList(keyword: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.presenter.searchRepositoriesList(keyword: searchBar.text!)
        self.searchBar.searchOff()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.searchOff()
    }
}
