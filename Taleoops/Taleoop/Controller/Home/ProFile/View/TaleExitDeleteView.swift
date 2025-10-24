
import UIKit

class TaleExitDeleteView: UIView {
    @IBOutlet weak var TopIcon: UIImageView!
    @IBOutlet weak var TitleNameLabel: UILabel!
    @IBOutlet weak var ContentLabel: UILabel!
        
    var syntonyCall:syntonyBlock?
        
    @IBOutlet weak var CancetImg: UIImageView!
    @IBOutlet weak var RechargeImg: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = WIDTH
        self.height = HEIGHT
                
        self.CancetImg.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                  return
            }
            self.removeFromSuperview()
        }
                
        self.RechargeImg.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                  return
            }
            self.syntonyCall?()
        }
                
    }
        
        
        
    @IBAction func CancelBtnAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
