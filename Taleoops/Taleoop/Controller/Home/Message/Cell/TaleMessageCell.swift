
import UIKit
import MJExtension
import RongIMLibCore

class TaleMessageCell: UITableViewCell {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ContentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    var model = RCConversation(){
        didSet {
            if model.objectName == "RC:TxtMsg" {
                let  latestMessages :RCTextMessage =  model .latestMessage! as! RCTextMessage
                if latestMessages.content.contains("TaleExpression__") {
                    ContentLabel.text  =  "Image"
                }else{
                    ContentLabel.text  =  latestMessages .content
                }
            }else if model.objectName  == "RC:ImgMsg" {
                ContentLabel.text = "RC:ImgMsg"
            }else{
                ContentLabel.text = "RC:Voice"
            }
            if let userData = UserDefaults.standard.object(forKey: "TaleoopUserID:\(model.targetId)") {
                let midel = TaleGenModel(userData)
                self.ImgView.sd_setUrlString(midel.groupware)
                self.NameLabel.text = midel.dioestrous
            }else {
                getAluminiumBlock(self.model.targetId.toInt()) { armonica, success in
                    if success {
                        let ardel = TaleGenModel(armonica["armonica"] as Any)
                        UserDefaults.standard.set(ardel.mj_JSONObject(), forKey: "TaleoopUserID:\(ardel.chylomicron)")
                        self.ImgView.sd_setUrlString(ardel.groupware)
                        self.NameLabel.text = ardel.dioestrous
                    }
                }
            }
        }
    }
        
}
extension String {
    internal func toInt()->Int{
        guard let intValue = Int(self) else {
            return 0
        }
        return intValue
    }
}
