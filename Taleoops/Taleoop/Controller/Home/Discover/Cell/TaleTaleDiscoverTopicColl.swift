
import UIKit

class TaleTaleDiscoverTopicColl: UICollectionViewCell {
    @IBOutlet weak var ImgView: UIImageView!
        
    @IBOutlet weak var ContentLabel: UILabel!
    var model  = TaleBeModel(){
        didSet {
            self.ContentLabel.text = model.polarisable
            self.ImgView.sd_setUrlString(model.importance?.groupware)
                        
        }
    }
    var callModel:syntonyModelBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    @IBAction func MoreBtnAction(_ sender: UIButton) {
        if self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
            let remoView = BottomRemoveView.initNibName()
            remoView.userID = self.model.chylomicron
            Windows.addSubview(remoView)
            remoView.callIndexBlock = {[weak self] idx in
                guard let self = self else { return }
                remoView.removeFromSuperview()
                self.callModel?(self.model)
            }
        } else {
            let showView = BottomBounceView.initNibName()
            Windows.addSubview(showView)
            showView.userID = self.model.importance!.chylomicron
            Windows.addSubview(showView)
            showView.callIndexBlock = {[weak self] mdl in
                guard let self = self else { return }
                showView.popHide()
                self.callModel?(self.model)
            }
        }
    }
}
