
import UIKit

class TaleCreateRoomController: BaseController {
        
    @IBOutlet weak var CountLabl: UILabel!
    @IBOutlet weak var EnterLabel: UILabel!
    @IBOutlet weak var UreaTextView: UITextView!{
        didSet {
            self.UreaTextView.tintColor = .black
            self.UreaTextView.delegate = self
        }
    }
    var GetMdlBlock:syntonyModelBlock?
    @IBOutlet weak var userLimitTxt: UITextField!
        
    @IBOutlet weak var RoundsTxt: UITextField!
        
    @IBOutlet weak var TimeLimitTxt: UITextField!
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Create"
                
    }
        
    @IBAction func ConfirmBtnAction(_ sender: UIButton) {
        if IsNilStr(self.UreaTextView.text){
            showHints("Please enter the title!", {})
            return
        }
        var charArray = [Any]()
        let msgDic = [
            "chylomicron": TaleUserData.shared.data.chylomicron,
            "dioestrous": TaleUserData.shared.data.dioestrous!,
            "groupware":TaleUserData.shared.data.groupware!,
        ] as [String : Any]
        charArray.append(msgDic)
                
        let ary = [
            "tailgunning":"StoryHubStr",
            "polarisable":self.UreaTextView.text!,
            "trilobal":self.userLimitTxt.text!,
            "desalinization":self.RoundsTxt.text!,
            "citrullin":self.TimeLimitTxt.text!,
            "avow":ArrayToString(charArray)
        ]
        ShowLoad()
        GetFrogBlock(ary) { armonica , success in
            HideLoad()
            if success {
                let ardol = TaleBeModel(armonica["armonica"] as Any)
                self.GetMdlBlock?(ardol)
                showHints {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
        
        
        
    @IBAction func OntBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if let text = self.userLimitTxt.text, let number = Int(text) {
                if number == 150 {
                    return
                }
                self.userLimitTxt.text = "\(number + 1)"
            }
        case 2:
            if let text = self.userLimitTxt.text, let number = Int(text) {
                if number == 1{
                    return
                }
                self.userLimitTxt.text = "\(number - 1)"
            }
        default:
            break
        }
    }
    @IBAction func TwoBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if let text = self.RoundsTxt.text, let number = Int(text) {
                if number == 8 {
                    return
                }
                self.RoundsTxt.text = "\(number + 1)"
            }
        case 2:
            if let text = self.RoundsTxt.text, let number = Int(text) {
                if number == 1{
                    return
                }
                self.RoundsTxt.text = "\(number - 1)"
            }
        default:
            break
        }
    }
    @IBAction func ThreeBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if let text = self.TimeLimitTxt.text, let number = Int(text) {
                if number == 180 {
                    return
                }
                self.TimeLimitTxt.text = "\(number + 1)"
            }
        case 2:
            if let text = self.TimeLimitTxt.text, let number = Int(text) {
                if number == 60{
                    return
                }
                self.TimeLimitTxt.text = "\(number - 1)"
            }
        default:
            break
        }
    }
        
        
}
extension TaleCreateRoomController : UITextViewDelegate {
    internal func textViewDidEndEditing(_ textView: UITextView) {
        self.EnterLabel.isHidden = textView.text.count == 0 ? false:true
        self.CountLabl.text = "\(textView.text.count)/150"
    }
    internal func textViewDidChange(_ textView: UITextView) {
        self.EnterLabel.isHidden = textView.text.count > 0 ? true:false
        self.CountLabl.text = "\(textView.text.count)/150"
                
        if let text = textView.text {
            let trimmedText = String(text.prefix(150))
            if text != trimmedText {
                textView.text = trimmedText
            }
        }
    }
}
