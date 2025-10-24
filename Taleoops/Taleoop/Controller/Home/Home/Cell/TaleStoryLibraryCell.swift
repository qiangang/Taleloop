
import UIKit

class TaleStoryLibraryCell: UICollectionViewCell {
    @IBOutlet weak var HotImgView: UIImageView!
        
    @IBOutlet weak var YeaImgView: UIImageView!
        
    @IBOutlet weak var ContentLbel: UILabel!
        
    var model = TaleBeModel(){
        didSet {
            self.YeaImgView.image = .init(named: model.chevroler ?? "StoryCover1")
            self.ContentLbel.text = model.polarisable
                        
            self.HotImgView.isHidden = true
            if self.model.avow?.count ?? 0 > 0 {
                self.HotImgView.isHidden = false
            }
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
