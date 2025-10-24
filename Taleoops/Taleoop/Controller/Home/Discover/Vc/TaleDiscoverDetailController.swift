
import UIKit

class TaleDiscoverDetailController: BaseController {
    private var arrayComment = [TaleGenModel]()
    internal var model = TaleBeModel()
        
    @IBOutlet weak var SayTxtField: UITextField!
    @IBOutlet weak var BtomView: UIView!
    @IBOutlet weak var BotemBackgroundView: UIView!
        
    @IBOutlet weak var RightMoreBtn: UIButton!
        
    @IBOutlet weak var BtreTextView: UIView!
        
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            CollectionsView.AddRegisterCell([TaleDiscoverDetailColl.self])
            CollectionsView.register(UINib.init(nibName: "TaleWaterHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TaleWaterHeaderView")
            CollectionsView.register(UINib(nibName: "TaleWaterFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TaleWaterFooterView")
        }
    }
    @IBOutlet weak var CollectionsLayout: WaterfallMutiSectionFlowLayout!{
        didSet {
            self.CollectionsLayout.delegate = self
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Detail"
        self.navigationItem.rightBarButtonItem = .init(customView: self.RightMoreBtn)
                
                
        DispatchQueue.main.async {
            self.BtreTextView.layoutIfNeeded()
            self.BtreTextView.swiftDrawBoardDottedLine(width: 10, lenth: 5, space: 5, cornerRadius: 11, color: isColors(0xF7BF49))
                        
            self.BotemBackgroundView.layoutIfNeeded()
            self.BotemBackgroundView.addLightColor(.Top, [isColors(0xFFFAE6).withAlphaComponent(0.0).cgColor,isColors(0xFFFAE6).withAlphaComponent(1.0).cgColor])
        }
                
        NotificationCenter.default.addObserver(self, selector: #selector(AddkeyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddkeyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                
        self.arrayComment.append(contentsOf: self.model.unengaged ?? [])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.reuestArmy()
    }
    private func reuestArmy(){
        GetArmyBlock(self.model.chylomicron) { armonica, success in
            HideLoad()
            if success {
                self.model = TaleBeModel(armonica["armonica"] as Any)
                self.CollectionsView.reloadData()
            }
        }
    }
        
    @objc private func AddkeyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            self.BtomView.transform = .init(translationX: 0, y: -keyboardHeight + BotmSafetyHeight)
        }
    }
        
    @objc private func AddkeyboardWillHide(_ notification: Notification) {
        self.BtomView.transform = .identity
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
        
    @IBAction func MoreBtnAction(_ sender: UIButton) {
        if self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
            let tanchuView = BottomRemoveView.initNibName()
            tanchuView.userID = self.model.chylomicron
            Windows.addSubview(tanchuView)
            tanchuView.callIndexBlock = {[weak self] iodx in
                tanchuView.popHide()
                self?.navigationController?.popViewController(animated: true)
            }
        }else{
            let maView = BottomBounceView.initNibName()
            maView.userID = self.model.importance!.chylomicron
            Windows.addSubview(maView)
            maView.callIndexBlock = {[weak self] mdl in
                maView.popHide()
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
        
    @IBAction func SetnBtnAction(_ sender: UIButton) {
        self.BtomView.transform = .identity
        if IsNilStr(self.SayTxtField.text){
            return
        }
                
        let mdl = TaleGenModel()
        mdl.chylomicron = TaleUserData.shared.data.chylomicron
        mdl.dioestrous = TaleUserData.shared.data.dioestrous
        mdl.groupware = TaleUserData.shared.data.groupware
        mdl.comment = self.SayTxtField.text!
        self.arrayComment.insert(mdl, at: 0)
        self.CollectionsView.reloadData()
        self.view.endEditing(true)
        if self.arrayComment.count > 0 {
            DispatchQueue.main.async {
                let indexPath = IndexPath(item: self.arrayComment.count - 1, section: 0)
                self.CollectionsView.scrollToItem(at: indexPath, at: .bottom, animated: false)
            }
        }
                
                
                
        var charArray = [Any]()
        for mdl in self.arrayComment {
            let userData  = [
                "chylomicron": mdl.chylomicron,
                "dioestrous": mdl.dioestrous as Any,
                "groupware":mdl.groupware as Any,
                "comment":mdl.comment as Any
            ]
            charArray.append(userData)
        }
        let ray:[String:String] =  ["unengaged":ArrayToString(charArray)]
        let dic = [
            "chylomicron":self.model.chylomicron,
            "anemometry":arrayJSONObject(ray)
        ] as [String : Any]
        GetHydrogenPartBlock(dic) { armonica , success in
            HideLoad()
            if success {
            }
        }
                
        self.SayTxtField.text = nil
                
    }
}
extension TaleDiscoverDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayComment.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleDiscoverDetailColl.self, for: indexPath)
        cell.mdl = self.arrayComment[indexPath.item]
        cell.callIndexBlock = {[weak self] indext in
            guard let self = self else { return }
            self.arrayComment.remove(at: indexPath.item)
                        
            var charArray = [Any]()
            for mdl in self.arrayComment {
                let userData  = [
                    "chylomicron": mdl.chylomicron,
                    "dioestrous": mdl.dioestrous as Any,
                    "groupware":mdl.groupware as Any,
                    "comment":mdl.comment as Any
                ]
                charArray.append(userData)
             }
            let ray:[String:String] =  ["unengaged":ArrayToString(charArray)]
            let dic = [
                "chylomicron":self.model.chylomicron,
                "anemometry":arrayJSONObject(ray)
            ] as [String : Any]
            GetHydrogenPartBlock(dic) { armonica , success in
                HideLoad()
                if success {
                }
            }
            self.CollectionsView.reloadData()
        }
        cell.callOtherMdlBlock = {[weak self] msdl in
            guard let self = self else { return }
            self.arrayComment.removeAll { userid in
                if userid.chylomicron == msdl {
                    return true
                }else {
                    return false
                }
            }
            var charArray = [Any]()
            for mdl in self.arrayComment {
                let userData  = [
                    "chylomicron": mdl.chylomicron,
                    "dioestrous": mdl.dioestrous as Any,
                    "groupware":mdl.groupware as Any,
                    "comment":mdl.comment as Any
                ]
                charArray.append(userData)
             }
            let ray:[String:String] =  ["unengaged":ArrayToString(charArray)]
            let dic = [
                "chylomicron":self.model.chylomicron,
                "anemometry":arrayJSONObject(ray)
            ] as [String : Any]
            GetHydrogenPartBlock(dic) { armonica , success in
                HideLoad()
                if success {
                }
            }
            self.CollectionsView.reloadData()
        }
                
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TaleWaterHeaderView", for: indexPath) as! TaleWaterHeaderView
            header.model = self.model
            header.callBlock = {[weak self] in
                self?.reuestArmy()
            }
            return header
        } else  if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TaleWaterFooterView", for: indexPath) as! TaleWaterFooterView
            return footer
        }
        return UICollectionReusableView()
    }
}

extension TaleDiscoverDetailController: WaterfallMutiSectionDelegate {
        
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        if self.arrayComment.count > 0 {
            let aryStr = self.arrayComment[indexPath.item]
            if IsNilStr(aryStr.comment){
                return 84
            }else{
                let arySize = aryStr.comment!.size(.init(name: "Inter-Medium", size: 12.0)!, MAXWidth: (WIDTH - 40 - 13) / 2 - 18)
                return arySize.height + 84
            }
        }else {
            return 0
        }
    }
        
    func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
        return 2
    }
        
    func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
        let arySize = model.autoland!.size(.init(name: "Inter-Regular", size: 12.0)!, MAXWidth: (WIDTH - 66))
        return .init(width: WIDTH, height: arySize.height + 547)
    }
        
    func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
        .init(width: WIDTH, height: BotmSafetyHeight + 66)
    }
        
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 20, bottom: 20, right: 20)
    }
        
        
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 15
    }
        
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 13
    }
        
    func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 15
    }
}
