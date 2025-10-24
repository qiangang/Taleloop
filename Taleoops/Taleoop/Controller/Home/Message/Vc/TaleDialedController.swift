
import UIKit

class TaleDialedController: BaseController {
    var model = TaleGenModel()
    @IBOutlet weak var TxImgView: UIImageView!
        
    @IBOutlet weak var BackdropImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.IsNaviBool = true
                
        self.TxImgView.sd_setUrlString(model.groupware)
        self.BackdropImgView.sd_setUrlString(model.groupware)
                
        let bgLayer1 = CALayer()
        bgLayer1.frame = .init(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        bgLayer1.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 0.3500).cgColor
        BackdropImgView.layer.addSublayer(bgLayer1)
    }
        
    @IBAction func CallBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
