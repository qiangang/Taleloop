
import UIKit

class TaleStoryHubColl: UICollectionViewCell {
    @IBOutlet weak var ImgView: UIImageView!
        
    @IBOutlet weak var UserImgView: UIImageView!
    @IBOutlet weak var ContentLable: UILabel!
    @IBOutlet weak var ProgreView: CustomProgressView!
    var model = TaleBeModel(){
        didSet  {
            self.ContentLable.text = model.polarisable
            self.UserImgView.sd_setUrlString(model.importance?.groupware)
            ProgreView.lable.text = "\(model.avow?.count ?? 0)/\(model.trilobal)"
            var num = Double(model.avow?.count ?? 0) / Double(model.trilobal)
            if num < 0.3 {
                num = 0.3
            }
            ProgreView.progress = CGFloat(min(num,1))
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
