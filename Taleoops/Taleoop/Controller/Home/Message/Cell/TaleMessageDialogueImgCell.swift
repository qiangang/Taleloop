
import UIKit
import RongIMLibCore

class TaleMessageDialogueImgCell: UITableViewCell {
    @IBOutlet weak var ImgView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    var mdl = RCMessage(){
        didSet {
            let mgUrl = mdl.content as! RCImageMessage
            if IsNilStr(mgUrl.remoteUrl) {
                self.ImgView.image = nil
            } else {
                self.ImgView.sd_setUrlString(mgUrl.remoteUrl!)
            }
         }
    }
}
