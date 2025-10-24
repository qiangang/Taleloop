
import UIKit

class TaleMessageColl: UICollectionViewCell {
    @IBOutlet weak var ImgView: UIImageView!
        
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var model = TaleGenModel(){
        didSet {
            self.ImgView.sd_setUrlString(model.groupware)
            self.nameLabel.text = model.dioestrous
        }
    }
        
    @IBAction func ChatBtnAction(_ sender: UIButton) {
        let vc = TaleMessageDialogueController()
        vc.model = self.model
        selfs.navigationController?.pushViewController(vc, animated: true)
    }
        
}
