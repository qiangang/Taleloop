
import UIKit

class TaleStoryRoomController: BaseController {
    private var arraySerbia = [TaleGenModel]()
    internal var mdl = TaleBeModel()
        
    @IBOutlet weak var BackdropView: UIView!
    @IBOutlet weak var SomeTextField: UITextField!
        
    let headerView = TaleStoryRoomView.initNibName()
    @IBOutlet weak var MoreBtn: UIButton!
    @IBOutlet weak var BtmView: UIView!
        
    @IBOutlet weak var TableView: UITableView!{
        didSet {
            self.TableView.AddRegisterCell([TaleStoryRoomCell.self])
        }
    }
    var classMdl:syntonyModelBlock?
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Story Hub"
        self.navigationItem.rightBarButtonItem = .init(customView: self.MoreBtn)
                
        DispatchQueue.main.async {
            self.BtmView.swiftDrawBoardDottedLine(width: 20, lenth: 5, space: 5, cornerRadius: 10, color: isColors(0xF7BF49))
        }
        self.headerView.model = self.mdl
        self.headerView.syntonyBlock = {[weak self] in
            guard let self = self else { return }
            self.TableView.reloadData()
        }
        self.arraySerbia.append(contentsOf: self.mdl.serbia ?? [])
    }
    @IBAction func KeyboardBtnAction(_ sender: UIButton) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.SomeTextField.becomeFirstResponder()
    }
        
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            self.BackdropView.transform = .init(translationX: 0, y: -keyboardHeight + BotmSafetyHeight)
        }
    }
          
    @objc private func keyboardWillHide(_ notification: Notification) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        self.BackdropView.transform = .identity
    }
        
        
    @IBAction func DeleteBtnAction(_ sender: UIButton) {
        if self.mdl.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
            let btomView = BottomRemoveView.initNibName()
            btomView.userID = self.mdl.chylomicron
            Windows.addSubview(btomView)
            btomView.callIndexBlock = {[weak self] idx in
                guard let self = self else { return }
                self.classMdl?(self.mdl)
                btomView.popHide()
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let reView = BottomBounceView.initNibName()
            reView.userID = self.mdl.chylomicron
            Windows.addSubview(reView)
            reView.callIndexBlock = {[weak self] mdl in
                guard let self = self else { return }
                reView.popHide()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
        
    @IBAction func ChatConversationBtnAction(_ sender: UIButton) {
        if IsNilStr(self.SomeTextField.text){
            return
        }
        let aemol = TaleGenModel()
        aemol.chylomicron = TaleUserData.shared.data.chylomicron
        aemol.dioestrous = TaleUserData.shared.data.dioestrous
        aemol.groupware = TaleUserData.shared.data.groupware
        aemol.comment = self.SomeTextField.text
        self.arraySerbia.append(aemol)
        self.TableView.reloadData()
        self.TableView.scrollToRow()
        self.view.endEditing(true)
                
                
        var charArray = [Any]()
        for mdl in self.arraySerbia{
            let userData  = [
                "chylomicron": mdl.chylomicron,
                "dioestrous": mdl.dioestrous as Any,
                "groupware":mdl.groupware as Any,
                "comment":mdl.comment as Any
            ]
            charArray.append(userData)
        }
        let ray:[String:String] =  ["serbia":ArrayToString(charArray)]
        let dic = [
            "chylomicron":self.mdl.chylomicron,
            "anemometry":arrayJSONObject(ray)
        ] as [String : Any]
        GetHydrogenPartBlock(dic) { armonica , success in
            HideLoad()
            if success {
            }
        }
        self.SomeTextField.text = nil
    }
        
    deinit {
        self.headerView.endTime()
    }
}
extension TaleStoryRoomController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arraySerbia.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.AddDequCell(TaleStoryRoomCell.self, for: indexPath)
        cell.model = self.arraySerbia[indexPath.item]
        return cell
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
        return self.headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}
