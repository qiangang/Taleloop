
import UIKit

class TaleHomeColl: UICollectionViewCell {
        
    @IBOutlet weak var nreImg: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var HotImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var model = TaleBeModel(){
        didSet {
            self.nreImg.image = .init(named: model.chevroler ?? "StoryCover1")
            self.TitleLabel.text = model.polarisable
            self.HotImgView.isHidden = true
            if self.model.avow?.count ?? 0 > 0 {
                self.HotImgView.isHidden = false
            }
        }
    }

}
