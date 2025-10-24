
import UIKit

class TaleProtocolView: UIView {
        
    @IBOutlet weak var PrivacyLabel: UILabel!
        
    @IBOutlet weak var ServiceLabel: UILabel!
    var syntonycBlock:syntonyBlock?
        
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = WIDTH
        self.height = HEIGHT
                
        PrivacyLabel.addGestureClick { ges in
            self.negotiatedClick(self.PrivacyLabel.text!)
        }
        ServiceLabel.addGestureClick { ges in
            self.negotiatedClick(self.ServiceLabel.text!)
        }
                
    }
    private func negotiatedClick(_ message:String){
        let vc = TaleTaleWebController()
        vc.WebTitleName = message
        if message == "Privacy Policy" {
            vc.ContentUrl = POLICYURL
        } else {
            vc.ContentUrl = SERVICEURL
        }
        let navi = BaseNavController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        selfs.present(navi, animated: true)
    }
        
    @IBAction func disagreeBtnClick(_ sender: UIButton) {
        self.removeFromSuperview()
    }
        
    @IBAction func agreeBtnClick(_ sender: UIButton) {
        self.removeFromSuperview()
        self.syntonycBlock?()
    }
}
