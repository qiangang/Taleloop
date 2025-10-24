
import UIKit

class TaleGiveAwayView: UIView {
    @IBOutlet weak var ImgView: UIImageView!
        
        
    @IBOutlet weak var CancelImgView: UIImageView!
    @IBOutlet weak var RecharegImgView: UIImageView!
        
    var callBack:syntonyBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = WIDTH
        self.height = HEIGHT
                
        self.CancelImgView.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                  return
            }
            self.removeFromSuperview()
        }
        self.RecharegImgView.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                  return
            }
            self.removeFromSuperview()
            self.callBack?()
        }
    }
        
}
