
import UIKit

class TaleDiscoverCell: UITableViewCell {
    @IBOutlet weak var BgImgView: UIImageView!
        
    @IBOutlet weak var UseImgView: UIImageView!
    @IBOutlet weak var PossteHeight: NSLayoutConstraint!
        
    @IBOutlet weak var dioestrousLabel: UILabel!
        
    var model = TaleBeModel(){
        didSet {
            let urls = model.stretcher?.first
            self.BgImgView.sd_setUrlString(urls as? String)
            self.UseImgView.sd_setUrlString(model.importance?.groupware)
            self.dioestrousLabel.text = model.importance?.dioestrous
        }
    }
    var callIndexBlock:syntonyIndexBlock?
    var syntonyBlock:syntonyBlock?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.PossteHeight.constant = SCALEH(190.0)
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
                
    }
        
    @IBAction func MoreBtnAction(_ sender: UIButton) {
        if self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
            let tanchuView = BottomRemoveView.initNibName()
            tanchuView.userID = self.model.chylomicron
            Windows.addSubview(tanchuView)
            tanchuView.callIndexBlock = {[weak self] iodx in
                guard let self = self else { return }
                self.syntonyBlock?()
                tanchuView.popHide()

            }
        }else{
            let maView = BottomBounceView.initNibName()
            maView.userID = self.model.importance!.chylomicron
            Windows.addSubview(maView)
            maView.callIndexBlock = {[weak self] mdl in
                guard let self = self else { return }
                maView.popHide()
                self.callIndexBlock?(mdl)
            }
        }
    }
}
