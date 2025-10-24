
import UIKit

class TaleDiscoverDetailColl: UICollectionViewCell {
    @IBOutlet weak var ContentTextLabel: UILabel!
        
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var callIndexBlock:syntonyIndexBlock?
    var callOtherMdlBlock:syntonyIndexBlock?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var mdl = TaleGenModel(){
        didSet {
            self.ContentTextLabel.text = mdl.comment
            self.ImgView.sd_setUrlString(mdl.groupware)
            self.nameLabel.text = mdl.dioestrous
        }
    }
        
        
    @IBAction func MoreBtnAction(_ sender: UIButton) {
        if mdl.chylomicron == TaleUserData.shared.data.chylomicron {
            let narView = BottomRemoveView.initNibName()
            narView.userID = self.mdl.chylomicron
            Windows.addSubview(narView)
            narView.callIndexBlock = {[weak self] chyIdx in
                guard let self = self else { return }
                narView.popHide()
                self.callIndexBlock?(chyIdx)
            }
        }else {
            let niaremlView = BottomBounceView.initNibName()
            niaremlView.userID = self.mdl.chylomicron
            Windows.addSubview(niaremlView)
            niaremlView.callIndexBlock = {[weak self] mdl in
                guard let self = self else { return }
                niaremlView.popHide()
                self.callOtherMdlBlock?(mdl)
            }
        }
    }
        
}
