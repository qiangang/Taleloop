
import UIKit

class TaleStoryContinueView: UIView {
    var callBlock:syntonyBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = WIDTH
        self.height = HEIGHT
    }

    @IBAction func ConfiremBtnAction(_ sender: UIButton) {
        self.removeFromSuperview()
        self.callBlock?()
    }
}
