
import UIKit
import IQKeyboardManagerSwift

class TaleCreateStoryController: BaseController {
    private var SelectCoverStr = String()
        
    @IBOutlet weak var UserLimitTextField: UITextField!
        
        
    @IBOutlet weak var RoundsTextField: UITextField!
        
        
    @IBOutlet weak var TimeLimitTextField: UITextField!
        
        
    private var SelectCopilot:Int = 1
        
    private var selectIndex:Int = -1
    private var ArraySelectCover = [TaleLibaryListModel]()
    @IBOutlet weak var ReporterView: UIView!
        
    @IBOutlet weak var StoryTextView: UITextView!{
        didSet {
            self.StoryTextView.tintColor = isColors(0xEC9860)
        }
    }
    @IBOutlet weak var YourJourneryTextView: UITextView!{
        didSet {
            self.YourJourneryTextView.tintColor = .black
            self.YourJourneryTextView.delegate = self
        }
    }
    @IBOutlet weak var HintLab: UILabel!
    @IBOutlet weak var JourCountLab: UILabel!
        
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleCreateStoryColl.self])
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        IQKeyboardManager.shared.isEnabled = true
        self.NameTitle.text = "Create a Story"
                
        EstablishDicJson("StroryLIbraryJson") { data, state in
            self.ArraySelectCover.removeAll()
            let oadel = TaleLibaryModel(data)
            self.ArraySelectCover.append(contentsOf: oadel.data ?? [])
            self.CollectionsView.reloadData()
        }
    }
    @IBAction private func StoryBtnAction(_ sender: UIButton) {
        self.SelectCopilot = sender.tag
        UIView.animate(withDuration: 0.25) {
            if sender.tag == 1 {
                self.ReporterView.transform = .identity
            }else if sender.tag == 2 {
                self.ReporterView.transform = .init(translationX: 59, y: 0)
            }
        }
    }
    @IBAction func ConfirmBtnAction(_ sender: UIButton) {
        if IsNilStr(self.StoryTextView.text){
            showHints("Please enter the title!", {})
            return
        }
                
        if IsNilStr(self.SelectCoverStr){
            showHints("Please select cover!", {})
            return
        }
        var charArray = [Any]()
        let msgDic = [
            "chylomicron": TaleUserData.shared.data.chylomicron,
            "dioestrous": TaleUserData.shared.data.dioestrous!,
            "groupware":TaleUserData.shared.data.groupware!,
            "comment":self.YourJourneryTextView.text!
        ] as [String : Any]
        charArray.append(msgDic)
                
        let ary = [
            "tailgunning":"StoryLibraryStr",
            "copilot":self.SelectCopilot,
            "polarisable":self.StoryTextView.text!,
            "trilobal":self.UserLimitTextField.text!,
            "desalinization":self.RoundsTextField.text!,
            "citrullin":self.TimeLimitTextField.text!,
            "chevroler":self.SelectCoverStr,
            "unengaged": IsNilStr(self.YourJourneryTextView.text) ? "" : ArrayToString(charArray)
        ] as [String : Any]
        ShowLoad()
        GetFrogBlock(ary) { armonica , success in
            HideLoad()
            if success {
                 showHints {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
        
    @IBAction func OneBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if let text = self.UserLimitTextField.text, let number = Int(text) {
                if number == 150 {
                    return
                }
                self.UserLimitTextField.text = "\(number + 1)"
            }
        case 2:
            if let text = self.UserLimitTextField.text, let number = Int(text) {
                if number == 60{
                    return
                }
                self.UserLimitTextField.text = "\(number - 1)"
            }
        default:
            break
        }
    }
    @IBAction func TwoBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if let text = self.RoundsTextField.text, let number = Int(text) {
                if number == 8 {
                    return
                }
                self.RoundsTextField.text = "\(number + 1)"
            }
        case 2:
            if let text = self.RoundsTextField.text, let number = Int(text) {
                if number == 1{
                    return
                }
                self.RoundsTextField.text = "\(number - 1)"
            }
        default:
            break
        }
    }
    @IBAction func ThreeBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if let text = self.TimeLimitTextField.text, let number = Int(text) {
                if number == 15 {
                    return
                }
                self.TimeLimitTextField.text = "\(number + 1)"
            }
        case 2:
            if let text = self.TimeLimitTextField.text, let number = Int(text) {
                if number == 1{
                    return
                }
                self.TimeLimitTextField.text = "\(number - 1)"
            }
        default:
            break
        }
    }
        
        
        
        
    deinit {
                
    }
}
extension TaleCreateStoryController : UITextViewDelegate {
    internal func textViewDidEndEditing(_ textView: UITextView) {
        self.HintLab.isHidden = textView.text.count == 0 ? false:true
        self.JourCountLab.text = "\(textView.text.count)/150"
    }
    internal func textViewDidChange(_ textView: UITextView) {
        self.HintLab.isHidden = textView.text.count > 0 ? true:false
        self.JourCountLab.text = "\(textView.text.count)/150"
                
        if let text = textView.text {
            let trimmedText = String(text.prefix(150))
            if text != trimmedText {
                textView.text = trimmedText
            }
        }
    }
}
extension TaleCreateStoryController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.ArraySelectCover.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Coll = collectionView.AddDequCell(TaleCreateStoryColl.self, for: indexPath)
        if self.selectIndex == indexPath.item {
            Coll.SeleBtn.isSelected = true
        }else{
            Coll.SeleBtn.isSelected = false
        }
        let moadel = self.ArraySelectCover[indexPath.item]
        Coll.ImgView.image = .init(named: moadel.nameInage!)
        return Coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectIndex = indexPath.item
        self.CollectionsView.reloadData()
        let mdl = self.ArraySelectCover[indexPath.item]
        self.SelectCoverStr = mdl.nameInage!
    }
        
}
