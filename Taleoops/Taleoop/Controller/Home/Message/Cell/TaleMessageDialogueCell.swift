
import UIKit
import RongIMLibCore

class TaleMessageDialogueCell: UITableViewCell {
    @IBOutlet weak var ContentLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    var model = RCMessage() {
        didSet {
            let mdl = model.content! as! RCTextMessage
            self.ContentLabel.text = mdl.content
        }
    }
        
}
