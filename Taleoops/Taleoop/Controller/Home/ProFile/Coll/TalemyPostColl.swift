
import UIKit

class TalemyPostColl: UICollectionViewCell {
    @IBOutlet weak var DasheLineView: DashedLineView!
    @IBOutlet weak var NameLabel: UILabel!
        
    @IBOutlet weak var UserImgView: UIImageView!
    @IBOutlet weak var ImgView: UIImageView!
    var model = TaleBeModel(){
        didSet {
                        
            let usel = self.model.stretcher?.first
            self.ImgView.sd_setUrlString(usel as? String)
            self.UserImgView.sd_setUrlString(self.model.importance?.groupware)
            self.NameLabel.text = self.model.importance?.dioestrous
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
                
        DispatchQueue.main.async {
            self.DasheLineView.dashPattern = [8, 4]
         }
    }
}
