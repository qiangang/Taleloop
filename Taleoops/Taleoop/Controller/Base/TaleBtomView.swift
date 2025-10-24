
import UIKit
import TTLBGenerals

class TaleBtomView: UIView {
    @IBOutlet private weak var MoreBtn: UIButton!
        
    @IBOutlet private weak var HomeBtn: UIButton!
    @IBOutlet private weak var MessageBtn: UIButton!
    @IBOutlet private weak var ProFileBtn: UIButton!
    private var ArraySelect = [UIButton]()
    @IBOutlet weak var selView: UIView! {
        didSet {
            selView.layer.borderColor = HeLoadPaletted.GettiCGColor("F8C4A0")
        }
    }
        
        
    @IBOutlet weak var unreadView: UIView!
    @IBOutlet weak var unreadNum: UILabel!
        
    var IdxCall:IdxCallBack?
    override func awakeFromNib() {
        super.awakeFromNib()
                
        self.ArraySelect.append(self.HomeBtn)
        self.ArraySelect.append(self.MessageBtn)
        self.ArraySelect.append(self.ProFileBtn)
        self.ArraySelect.append(self.MoreBtn)
                
                
        self.HomeBtn.isEnabled = true
        HomeBtn.isSelected = true
    }
        
    @IBAction private func TabBarButtonAction(_ sender: UIButton) {
        for btn in self.ArraySelect {
            if btn.tag == sender.tag {
                btn.isSelected = true
            }else{
                btn.isSelected = false
            }
        }
        DispatchQueue.main.async {
            self.IdxCall?(sender.tag)
        }
    }
        
}
