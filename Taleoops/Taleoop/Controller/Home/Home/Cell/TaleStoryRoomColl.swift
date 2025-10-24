
import UIKit

class TaleStoryRoomColl: UICollectionViewCell {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var NumCoun: UILabel!
    var model = TaleGenModel(){
        didSet {
            self.ImgView.sd_setUrlString(model.groupware)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
