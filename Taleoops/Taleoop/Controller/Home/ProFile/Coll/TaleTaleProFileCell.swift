
import UIKit

class TaleTaleProFileCell: UICollectionViewCell {
    @IBOutlet weak var ImgView: UIImageView!
        
    @IBOutlet weak var AccountLab: UILabel!
    @IBOutlet weak var NameLabel: UILabel!{
        didSet {
                        
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.AccountLab.isHidden = true
    }

}
