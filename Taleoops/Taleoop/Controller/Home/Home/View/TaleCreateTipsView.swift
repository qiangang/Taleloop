
import UIKit

class TaleCreateTipsView: UIView {
    @IBOutlet weak var RechargeBtnAction: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = WIDTH
        self.height = HEIGHT
                
        self.RechargeBtnAction.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                  return
            }
            self.removeFromSuperview()
            let vc = TaleRechargeController()
            selfs.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func CancelBtnAction(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
