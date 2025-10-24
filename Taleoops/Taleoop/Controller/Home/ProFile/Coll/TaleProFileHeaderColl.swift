
import UIKit

class TaleProFileHeaderColl: UICollectionReusableView {
    @IBOutlet weak var TopHeight: NSLayoutConstraint!
    @IBOutlet weak var dioestrousLab: UILabel!
    @IBOutlet weak var uncusLab: UILabel!
        
    @IBOutlet weak var uniovularLabel: UILabel!
    @IBOutlet weak var groupwareImgView: UIImageView!
        
        
    var model = TaleGenModel(){
        didSet {
            self.groupwareImgView.sd_setUrlString(model.groupware)
            self.dioestrousLab.text = model.dioestrous
            self.uncusLab.text = "ID:\(model.uncus)"
            self.uniovularLabel.text = String.localeNum(model.uniovular)
        }
    }
        
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.TopHeight.constant = 48 + StatusBarHei
    }
        
        
        
    @IBAction func RechargeBtnAction(_ sender: UIButton) {
        let vc = TaleRechargeController()
        selfs.navigationController?.pushViewController(vc, animated: true)
    }
        
        
    @IBAction func EidtBtnAction(_ sender: UIButton) {
        let vc = TaleEidtController()
        selfs.navigationController?.pushViewController(vc, animated: true)
    }
        
}
