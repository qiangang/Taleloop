
import UIKit

class TaleAnotherpersonController: BaseController {
    @IBOutlet weak var MoreBtn: UIButton!
    @IBOutlet weak var FollowingLabel: UILabel!
    @IBOutlet weak var FollowersLabel: UILabel!
    @IBOutlet weak var FollowBtn: UIButton!
    @IBOutlet weak var MessageLabel: UILabel!{
        didSet {
            let attrString = NSMutableAttributedString(string: self.MessageLabel.text!)
            let attr: [NSAttributedString.Key : Any] = [.font: UIFont(name: "Inter-ExtraBold", size: 14)!,.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), .strokeColor: UIColor(red: 0.8,green: 0.53,blue: 0.24,alpha: 1), .strokeWidth: -6]
            attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
            MessageLabel.attributedText = attrString
        }
    }
    @IBOutlet weak var FollowLabel: UILabel!{
        didSet {
            let attrString = NSMutableAttributedString(string: self.FollowLabel.text!)
            let attr: [NSAttributedString.Key : Any] = [.font: UIFont(name: "Inter-ExtraBold", size: 14)!,.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), .strokeColor: UIColor(red: 0.8,green: 0.53,blue: 0.24,alpha: 1), .strokeWidth: -6]
            attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
            FollowLabel.attributedText = attrString
        }
    }
        
    @IBOutlet weak var OtherImgView: UIImageView!
    @IBOutlet weak var OtherNameLabel: UILabel!
    @IBOutlet weak var OtherIDLabel: UILabel!
        
        
    var model = TaleGenModel()
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.OtherImgView.sd_setUrlString(self.model.groupware)
        self.OtherNameLabel.text = self.model.dioestrous
        self.OtherIDLabel.text = "ID: \(self.model.uncus)"
                
        self.FollowingLabel.text = "\(self.model.finnish)"
        self.FollowersLabel.text = "\(self.model.photosurface)"
                
        self.FollowBtn.isSelected = self.model.delimiter
        if self.model.delimiter {
            self.FollowLabel.text = "Followed"
            self.FollowBtn.isSelected = true
        }else{
            self.FollowLabel.text = "Follow"
            self.FollowBtn.isSelected = false
        }
        self.navigationItem.rightBarButtonItem = .init(customView: self.MoreBtn)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requestOther()
    }
    private func requestOther(){
        getAluminiumBlock(self.model.chylomicron) { armonica , success in
            if success {
                self.model = TaleGenModel(armonica["armonica"] as Any)
                                
                if self.model.delimiter {
                    self.FollowLabel.text = "Followed"
                }else{
                    self.FollowLabel.text = "Follow"
                }
                self.FollowBtn.isSelected = self.model.delimiter
                                
                self.FollowingLabel.text = "\(self.model.finnish)"
                self.FollowersLabel.text = "\(self.model.photosurface)"
                                
            }
        }
    }
    @IBAction func MessageBtnAction(_ sender: UIButton) {
        let vc = TaleMessageDialogueController()
        vc.model = self.model
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
        
    @IBAction func FollowBtnActon(_ sender: UIButton) {
                
        if sender.isSelected {
            self.FollowLabel.text = "Followed"
        }else {
            self.FollowLabel.text = "Follow"
        }
        let ary = [
            "frigidarium":self.model.chylomicron,
            "delimiter":sender.isSelected ? "0" : "1"
        ] as [String : Any]
                
        ShowLoad()
        GetSecondBlock(ary) { armonica , success in
            HideLoad()
            if success {
                self.requestOther()
            }
        }
    }
        
        
    @IBAction func StoreBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            let vc = TaleMyStoryController()
            vc.UserID = self.model.chylomicron
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = TalemyPostController()
            vc.UserID = self.model.chylomicron
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = TaleMyLikeController()
            vc.UserID = self.model.chylomicron
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
        
    @IBAction func MoreBtnAction(_ sender: UIButton) {
        let showView = BottomBounceView.initNibName()
        Windows.addSubview(showView)
        showView.userID = self.model.chylomicron
        Windows.addSubview(showView)
        showView.callIndexBlock = {[weak self] mdl in
            guard let self = self else { return }
            showView.popHide()
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
        
}
