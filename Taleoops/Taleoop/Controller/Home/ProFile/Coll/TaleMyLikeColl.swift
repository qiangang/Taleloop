
import UIKit

class TaleMyLikeColl: UICollectionViewCell {
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var UserImgView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
        
    var model = TaleBeModel(){
        didSet {
                        
            let usel = self.model.stretcher?.first
            self.ImgView.sd_setUrlString(usel as? String)
            self.UserImgView.sd_setUrlString(self.model.importance?.groupware)
            self.NameLabel.text = self.model.importance?.dioestrous
        }
    }
        
        

}
