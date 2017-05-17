import UIKit

class RepositoryTableCell: UITableViewCell {

    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryUrlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
