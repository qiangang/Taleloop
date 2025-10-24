
import UIKit

class TaleMessageTitleView: UIView {
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
        
    var model = TaleGenModel(){
        didSet {
            self.ImgView.sd_setUrlString(model.groupware)
            self.NameLabel.text = model.dioestrous
        }
    }
        
    @IBAction func UserBtnAction(_ sender: UIButton) {
        let vc = TaleAnotherpersonController()
        vc.model = self.model
        selfs.navigationController?.pushViewController(vc, animated: true)
    }
        
}
