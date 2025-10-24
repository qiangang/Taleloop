
import UIKit

class TaleStoryRoomView: UIView {
    private var selectIndex : Int = 0
    private var timer = Timer()
    private var countDownTimer = Timer()
        
    private var arrayUser = [TaleGenModel]()
        
    @IBOutlet weak var UnengeLabel: UILabel!
        
    @IBOutlet weak var BgView: UIView!
        
    var arStr = [String]()
        
    @IBOutlet weak var ResumBtn: UIButton!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var TitleNameLabel: UILabel!
    @IBOutlet weak var ResumTextView: UITextView!{
        didSet {
            self.ResumTextView.tintColor = isColors(0xEC9860)
            self.ResumTextView.delegate = self
            self.ResumTextView.returnKeyType = .send
        }
    }
    var syntonyBlock:syntonyBlock?
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleStoryRoomColl.self])
            self.CollectionsView.delegate = self
            self.CollectionsView.dataSource = self
        }
    }
        
    var model = TaleBeModel(){
        didSet {
            self.TitleNameLabel.text = model.polarisable
            self.TimeLabel.text = "\(model.citrullin)"
                        
            if self.model.unengaged?.count == 0 {
                self.UnengeLabel.isHidden = true
            }else{
                self.UnengeLabel.isHidden = false
                self.arStr.removeAll()
                for ardel in self.model.unengaged ?? [] {
                    let mci = ardel.comment
                    arStr.append(mci!)
                }
                let stringNumbers = arStr.map { String($0) }.joined(separator: "\n")
                self.UnengeLabel.text = stringNumbers
            }
                        
            starTime()
            self.arrayUser.removeAll()
            self.arrayUser.append(contentsOf: self.model.avow ?? [])
                        
            DispatchQueue.main.async {
                self.BgView.swiftDrawBoardDottedLine(width: 10, lenth: 3, space: 3, cornerRadius: 10, color: isColors(0xF7BF49))
            }
            self.CollectionsView.reloadData()
        }
    }
        
    func starTime() {
        countDownTimer.startTiming(maxTime: self.model.citrullin) {[weak self] value in
            guard let `self` = self else { return }
            self.TimeLabel.text = "\(value)"
        } complete: {
                        
            if self.selectIndex == self.arrayUser.count - 1{
                self.selectIndex = 0
            }else{
                self.selectIndex += 1
            }
            let miadMdel = self.arrayUser[self.selectIndex]
                        
            self.CollectionsView.reloadData()
            if miadMdel.chylomicron == TaleUserData.shared.data.chylomicron {
            }else {
                self.ResumTextView.text = nil
                selfs.view.endEditing(true)
            }
                        
            self.starTime()
            self.ResumBtn.bringSubviewToFront(selfs.view)
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
                
        DispatchQueue.main.async {
            self.BgView.swiftDrawBoardDottedLine(width: 10, lenth: 3, space: 3, cornerRadius: 10, color: isColors(0xF7BF49))
        }
    }
    internal func endTime(){
        self.countDownTimer.cancelTiming()
    }
    @IBAction private func RedactBtnAction(_ sender: UIButton) {
        selfs.view.endEditing(true)
        let miadMdel = self.arrayUser[self.selectIndex]
        if miadMdel.chylomicron == TaleUserData.shared.data.chylomicron {
            self.ResumTextView.becomeFirstResponder()
        }
    }
        
}

extension TaleStoryRoomView :UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.model.trilobal
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleStoryRoomColl.self, for: indexPath)
        if self.arrayUser.count > indexPath.item {
            cell.model = self.arrayUser[indexPath.item]
            cell.ImgView.isUserInteractionEnabled = false
        }else {
            cell.ImgView.image = .init(named: "XixzuoerICon")
            cell.ImgView.isUserInteractionEnabled = true
            cell.ImgView.addGestureClick {[weak self] ges in
                                
                guard let `self` = self else { return }
                                
                var isTrue:Bool = false
                for mdl in self.arrayUser {
                    if mdl.chylomicron == TaleUserData.shared.data.chylomicron {
                        isTrue = true
                        break
                    }
                }
                if isTrue == false {
                    let dadel = TaleGenModel()
                    dadel.chylomicron = TaleUserData.shared.data.chylomicron
                    dadel.dioestrous = TaleUserData.shared.data.dioestrous!
                    dadel.groupware = TaleUserData.shared.data.groupware!
                    self.arrayUser.append(dadel)
                                        
                    self.CollectionsView.reloadData()
                                        
                    var charArray = [Any]()
                    for mdl in self.arrayUser {
                        let userData  = [
                            "chylomicron": mdl.chylomicron,
                            "dioestrous": mdl.dioestrous as Any,
                            "groupware":mdl.groupware as Any,
                            "comment":mdl.comment as Any
                        ]
                        charArray.append(userData)
                    }
                    let ray:[String:String] =  ["avow":ArrayToString(charArray)]
                    let dic = [
                        "chylomicron":self.model.chylomicron,
                        "anemometry":arrayJSONObject(ray)
                    ] as [String : Any]
                    GetHydrogenPartBlock(dic) { armonica , success in
                        HideLoad()
                    }
                }
            }
        }
        cell.NumCoun.text = "\(indexPath.item + 1)"
        if self.selectIndex == indexPath.item {
            cell.BgView.isHidden = false
        }else{
            cell.BgView.isHidden = true
        }
        return cell
    }
}
extension TaleStoryRoomView : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            self.usersgne(textView.text)
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    private func usersgne(_ str:String){
        if IsNilStr(self.ResumTextView.text){
            return
        }
        self.arStr.append(str)
        let stringNumbers = arStr.map { String($0) }.joined(separator: "\n")
        self.UnengeLabel.text = stringNumbers
                
        var charArray = [Any]()
        for mdl in self.model.unengaged ?? [] {
            let userData  = [
                "chylomicron": mdl.chylomicron,
                "dioestrous": mdl.dioestrous as Any,
                "groupware":mdl.groupware as Any,
                "comment":mdl.comment as Any
            ]
            charArray.append(userData)
        }
                
        let msgDic = [
            "chylomicron": TaleUserData.shared.data.chylomicron,
            "dioestrous": TaleUserData.shared.data.dioestrous!,
            "groupware":TaleUserData.shared.data.groupware!,
            "comment":self.ResumTextView.text!
        ] as [String : Any]
        charArray.append(msgDic)
                
        let ray:[String:String] =  ["unengaged":ArrayToString(charArray)]
        let dic = [
            "chylomicron":self.model.chylomicron,
            "anemometry":arrayJSONObject(ray)
        ] as [String : Any]
        GetHydrogenPartBlock(dic) { armonica , success in
            HideLoad()
            if success {}
        }
        self.syntonyBlock?()
        self.ResumTextView.text = nil
                
        DispatchQueue.main.async {
            self.BgView.swiftDrawBoardDottedLine(width: 10, lenth: 3, space: 3, cornerRadius: 10, color: isColors(0xF7BF49))
        }
    }
}
