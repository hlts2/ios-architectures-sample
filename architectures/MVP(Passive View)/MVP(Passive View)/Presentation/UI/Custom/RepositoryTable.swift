import UIKit

class RepositoryTable: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func hiddenEmptyCell() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.tableFooterView = view
    }
}
