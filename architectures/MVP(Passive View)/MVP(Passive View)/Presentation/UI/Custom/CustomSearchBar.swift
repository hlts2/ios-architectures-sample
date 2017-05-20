import UIKit

class CustomSearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func searchOn() {
        self.showsCancelButton = true
    }
    
    func searchOff() {
        self.showsCancelButton = false
        self.resignFirstResponder()
    }
}
