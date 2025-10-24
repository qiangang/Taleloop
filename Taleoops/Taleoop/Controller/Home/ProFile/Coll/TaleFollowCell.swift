
import UIKit

class TaleFollowCell: UITableViewCell {
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var UserNameLabel: UILabel!
        
    @IBOutlet weak var OneBtn: UIButton!
    @IBOutlet weak var TwoBtn: UIButton!
    @IBOutlet weak var ThreeBtn: UIButton!
        
    var model = TaleGenModel(){
        didSet {
            self.ImgView.sd_setUrlString(model.groupware)
            self.UserNameLabel.text = model.dioestrous
            self.TwoBtn.isSelected = model.delimiter
        }
    }
    var userMdlBlock:UserModelBlock?
    var callBlock:syntonyBlock?
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
    @IBAction func OneBtnAction(_ sender: UIButton) {
        let ary = [
            "frigidarium":self.model.chylomicron,
            "delimiter":"0"
        ] as [String : Any]
        ShowLoad()
        GetSecondBlock(ary) { armonica, success in
            HideLoad()
            if success {
                self.userMdlBlock?(self.model)
            }
        }
    }
        
    @IBAction func TwoBtnAction(_ sender: UIButton) {
        let ary = [
            "frigidarium":self.model.chylomicron,
            "delimiter":sender.isSelected ? "0" : "1"
        ] as [String : Any]
        ShowLoad()
        GetSecondBlock(ary) { armonica, success in
            HideLoad()
            if success {
                self.callBlock?()
            }
        }
    }
        
        
    @IBAction func RemoveBtnAction(_ sender: UIButton) {
        ShowLoad()
        GetSpontaneousBlock(self.model.chylomicron) { armonica, success in
            HideLoad()
            if success {
                self.userMdlBlock?(self.model)
             }
        }
    }

}
