
import UIKit
import RongIMLibCore

class TaleMessageDialogueSoundCell: UITableViewCell {
    typealias callRongModel = (_ mdl:RCMessage,_ isSelecteds:Bool) -> Void

    @IBOutlet weak var SleepRoughBtn: UIButton!
    @IBOutlet weak var BivouacLabel: UILabel!
    internal var CallModel:callRongModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    var model = RCMessage(){
        didSet {
            let Tunt = model.content as! RCVoiceMessage
             self.BivouacLabel.text = "\(Tunt.duration)s"
        }
    }
        
        
    @IBAction func SleepRoughBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

        self.CallModel?(self.model,sender.isSelected)

    }
        
}
